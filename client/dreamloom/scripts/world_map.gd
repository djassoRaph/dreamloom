extends Node2D

@onready var tile_map: TileMap = $TileMap

const GROUND_LAYER = 0
const OBJECTS_LAYER = 1

# Tile type ranges - using simple constants since GDScript doesn't allow range() in const
const DIRT_START = 0
const DIRT_END = 19
const GRASS_START = 20
const GRASS_END = 39
const OBJECTS_START = 40
const OBJECTS_END = 49
const ROCKS_START = 50
const ROCKS_END = 69
const ICE_START = 70
const ICE_END = 89
const WATER_START = 90
const WATER_END = 114

func _ready():
	setup_tilemap()
	create_test_world()

func setup_tilemap():
	# Add an objects layer for decorative items
	tile_map.add_layer(1)
	tile_map.set_layer_name(1, "Objects")
	tile_map.set_layer_z_index(1, 1)  # Objects render above ground

func create_test_world():
	# Create a simple test world
	var map_size = Vector2i(20, 15)
	
	# Fill with grass base
	for x in range(-map_size.x/2, map_size.x/2):
		for y in range(-map_size.y/2, map_size.y/2):
			var pos = Vector2i(x, y)
			# Use grass tiles (20-39)
			var grass_tile_id = GRASS_START + (x + y) % (GRASS_END - GRASS_START + 1)
			tile_map.set_cell(GROUND_LAYER, pos, 0, Vector2i(grass_tile_id % 20, grass_tile_id / 20))
	
	# Create a dirt path
	create_dirt_path()
	
	# Add some rocks as obstacles
	add_obstacles()
	
	# Add a water pond
	add_water_pond()
	
	# Add decorative objects
	add_decorative_objects()

func create_dirt_path():
	# Horizontal path
	for x in range(-8, 9):
		var pos = Vector2i(x, 0)
		var dirt_tile_id = DIRT_START + randi() % (DIRT_END - DIRT_START + 1)
		tile_map.set_cell(GROUND_LAYER, pos, 0, Vector2i(dirt_tile_id % 20, dirt_tile_id / 20))
	
	# Vertical path
	for y in range(-6, 7):
		var pos = Vector2i(0, y)
		var dirt_tile_id = DIRT_START + randi() % (DIRT_END - DIRT_START + 1)
		tile_map.set_cell(GROUND_LAYER, pos, 0, Vector2i(dirt_tile_id % 20, dirt_tile_id / 20))

func add_obstacles():
	# Add some rocks scattered around
	var rock_positions = [
		Vector2i(5, 3),
		Vector2i(-6, 4),
		Vector2i(7, -5),
		Vector2i(-4, -3),
		Vector2i(3, 6),
		Vector2i(-7, -2)
	]
	
	for pos in rock_positions:
		var rock_tile_id = ROCKS_START + randi() % (ROCKS_END - ROCKS_START + 1)
		tile_map.set_cell(OBJECTS_LAYER, pos, 0, Vector2i(rock_tile_id % 20, rock_tile_id / 20))

func add_water_pond():
	# Create a small pond in the corner
	var pond_center = Vector2i(6, 6)
	var pond_tiles = [
		Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0),
		Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1),
		Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2)
	]
	
	for tile_offset in pond_tiles:
		var pos = pond_center + tile_offset
		var water_tile_id = WATER_START + randi() % (WATER_END - WATER_START + 1)
		tile_map.set_cell(GROUND_LAYER, pos, 0, Vector2i(water_tile_id % 20, water_tile_id / 20))

func add_decorative_objects():
	# Add some flowers and small objects
	var decoration_positions = [
		Vector2i(2, 2),
		Vector2i(-3, 2),
		Vector2i(4, -2),
		Vector2i(-2, -4),
		Vector2i(1, 4)
	]
	
	for pos in decoration_positions:
		var deco_tile_id = OBJECTS_START + randi() % (OBJECTS_END - OBJECTS_START + 1)
		tile_map.set_cell(OBJECTS_LAYER, pos, 0, Vector2i(deco_tile_id % 20, deco_tile_id / 20))

func is_walkable(map_position: Vector2i) -> bool:
	var ground_tile = tile_map.get_cell_source_id(GROUND_LAYER, map_position)
	var object_tile = tile_map.get_cell_source_id(OBJECTS_LAYER, map_position)
	
	# Check if ground tile is walkable
	if ground_tile == -1:
		return false
		
	var ground_atlas_coords = tile_map.get_cell_atlas_coords(GROUND_LAYER, map_position)
	var ground_tile_id = ground_atlas_coords.y * 20 + ground_atlas_coords.x
	
	# Check water tiles
	if ground_tile_id >= WATER_START and ground_tile_id <= WATER_END:
		return false
	
	# Check if there's a blocking object
	if object_tile != -1:
		var object_atlas_coords = tile_map.get_cell_atlas_coords(OBJECTS_LAYER, map_position)
		var object_tile_id = object_atlas_coords.y * 20 + object_atlas_coords.x
		
		# Rocks block movement
		if object_tile_id >= ROCKS_START and object_tile_id <= ROCKS_END:
			return false
	
	return true

func get_spawn_position() -> Vector2:
	# Return a safe spawn position on the dirt path
	return tile_map.map_to_local(Vector2i(0, 0))