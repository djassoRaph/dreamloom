extends CharacterBody2D

# Player controller for isometric movement
# Supports both WASD and Arrow keys

const SPEED = 200.0
const ISOMETRIC_RATIO = Vector2(2, 1)  # 2:1 isometric projection

@onready var sprite = $Sprite2D

func _ready():
	print("Player initialized at position: ", position)

func _physics_process(_delta):
	# Get input direction
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction != Vector2.ZERO:
		# Convert to isometric coordinates
		var iso_direction = _cartesian_to_isometric(input_direction)
		velocity = iso_direction.normalized() * SPEED

		# Flip sprite based on direction
		if input_direction.x != 0:
			sprite.flip_h = input_direction.x < 0
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()

func _cartesian_to_isometric(cartesian: Vector2) -> Vector2:
	# Convert Cartesian input to isometric movement
	# For isometric (2:1 ratio), we transform the input vector
	var iso_x = cartesian.x - cartesian.y
	var iso_y = (cartesian.x + cartesian.y) * 0.5
	return Vector2(iso_x, iso_y)

func _isometric_to_cartesian(isometric: Vector2) -> Vector2:
	# Convert isometric coordinates back to Cartesian (for tile mapping)
	var cart_x = (isometric.x / 2 + isometric.y)
	var cart_y = (isometric.y - isometric.x / 2)
	return Vector2(cart_x, cart_y)
