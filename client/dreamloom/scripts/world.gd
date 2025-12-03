extends Node2D

# World/Scene manager for DreamLoom
# Handles the isometric world, networking, and UI coordination

@onready var camera = $Camera2D
@onready var player = $Player
@onready var world_map = $WorldMap
@onready var chat_history = $UI/ChatPanel/VBoxContainer/ChatHistory
@onready var chat_input = $UI/ChatPanel/VBoxContainer/ChatInput
@onready var connection_status = $UI/ConnectionStatus

# Network configuration
var websocket_url = "ws://localhost:8080"
var socket = WebSocketPeer.new()
var connection_state = WebSocketPeer.STATE_CLOSED

func _ready():
	print("DreamLoom World Initializing...")

	# Connect chat input
	chat_input.text_submitted.connect(_on_chat_submitted)

	# Set player spawn position from world map
	player.position = world_map.get_spawn_position()
	
	# Setup camera to follow player
	camera.position = player.position

	# Attempt to connect to server
	connect_to_server()

	print("World ready! Press WASD or Arrow Keys to move")

func _process(_delta):
	# Poll websocket
	socket.poll()

	var state = socket.get_ready_state()
	if state != connection_state:
		connection_state = state
		_on_connection_state_changed(state)

	# Receive messages
	while socket.get_ready_state() == WebSocketPeer.STATE_OPEN and socket.get_available_packet_count():
		var packet = socket.get_packet()
		var message = packet.get_string_from_utf8()
		_on_message_received(message)

	# Update camera to follow player smoothly
	camera.position = camera.position.lerp(player.position, 0.1)

func connect_to_server():
	print("Connecting to server: ", websocket_url)
	var error = socket.connect_to_url(websocket_url)
	if error != OK:
		print("Failed to connect: ", error)
		connection_status.text = "Connection Failed"
		connection_status.modulate = Color.RED
	else:
		connection_status.text = "Connecting..."
		connection_status.modulate = Color.YELLOW

func _on_connection_state_changed(state):
	match state:
		WebSocketPeer.STATE_OPEN:
			print("Connected to server!")
			connection_status.text = "Connected"
			connection_status.modulate = Color.GREEN
			_send_message({"type": "join", "name": "Player"})

		WebSocketPeer.STATE_CLOSING:
			connection_status.text = "Disconnecting..."
			connection_status.modulate = Color.YELLOW

		WebSocketPeer.STATE_CLOSED:
			print("Disconnected from server")
			connection_status.text = "Disconnected"
			connection_status.modulate = Color.RED

func _on_message_received(message_text: String):
	print("Received: ", message_text)

	var json = JSON.new()
	var parse_result = json.parse(message_text)

	if parse_result != OK:
		print("Failed to parse JSON: ", message_text)
		return

	var message = json.data

	match message.get("type"):
		"chat":
			_display_chat(message.get("from", "Unknown"), message.get("text", ""))
		"system":
			_display_system(message.get("text", ""))
		"position":
			# Handle other player position updates
			pass

func _send_message(data: Dictionary):
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		var json_string = JSON.stringify(data)
		socket.send_text(json_string)

func _on_chat_submitted(text: String):
	if text.is_empty():
		return

	if socket.get_ready_state() != WebSocketPeer.STATE_OPEN:
		_display_system("Not connected to server!")
		return

	# Send chat message
	_send_message({"type": "chat", "text": text})
	chat_input.clear()

func _display_chat(from: String, text: String):
	chat_history.append_text("[b]%s:[/b] %s\n" % [from, text])

func _display_system(text: String):
	chat_history.append_text("[color=gray][i]%s[/i][/color]\n" % text)
