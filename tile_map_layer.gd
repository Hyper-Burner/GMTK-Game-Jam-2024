extends TileMapLayer
@export var selected_machine : int
var machine = preload("res://Classes/machine.tscn")
var machinesprite = preload("res://test.PNG")
@onready var groundlayer = $ground

var place_new = false # Set this to true when there is a new node created to move
var node_to_move # Change the node this is linked to when there is a new node to place
var direction = 0
var radius = 256

var hold_button: bool = false # Checks to see if button is held down during building
func _process(delta: float) -> void:

	if Input.is_action_just_pressed("rotate"):
		direction += 90
		get_node("FollowMouse").rotation_degrees += 90
	if hold_button:
		var location = local_to_map(get_global_mouse_position())
		if(Input.is_action_pressed("left_click")):
			if World.get_cell(location) == null and location.x <= radius and location.x >= -radius and location.y <= radius and location.y >= -radius:
				if(selected_machine == 1 and self.get_cell_source_id(location) == 0):
					place_machine(machine, location, direction)
					World.get_cell(location)[0].bamboo_delete = self.get_cell_atlas_coords(location);
					self.erase_cell(location)
				elif(selected_machine > 1 and self.get_cell_source_id(location) != 0):
						place_machine(machine, location, direction)
		elif(Input.is_action_pressed("right_click")):
			if( World.get_cell(location) != null and World.get_cell(location)[0].id == 1):
				if (World.get_cell(location) != null and World.get_cell(location)[0].bamboo_delete != null):
					self.set_cell(local_to_map(get_global_mouse_position()), 0, World.get_cell(location)[0].bamboo_delete)
					erase_cells(World.get_cell(location)[0])
			elif( World.get_cell(location) != null and World.get_cell(location)[0].id > 1 ):
				erase_cells(World.get_cell(location)[0])
	if place_new:
		var location = local_to_map(get_global_mouse_position())
		get_node("FollowMouse").position = Vector2(location.x * 16 + 8, location.y * 16 + 8)
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and place_new:
		if Input.is_action_pressed("left_click") or Input.is_action_pressed("right_click"):
			hold_button = true
			var location = local_to_map(get_global_mouse_position())
			if World.get_cell(location) == null and location.x <= radius and location.x >= -radius and location.y <= radius and location.y >= -radius:
				if(selected_machine == 1 and self.get_cell_source_id(location) == 0):
					place_machine(machine, location, direction)
					World.get_cell(location)[0].bamboo_delete = self.get_cell_atlas_coords(location);
					self.erase_cell(location)
				elif(selected_machine > 1 and self.get_cell_source_id(location) != 0):
					place_machine(machine, location, direction)
		elif Input.is_action_just_released("left_click") or Input.is_action_just_released("right_click"):
			hold_button = false
				


func place_machine(machine: PackedScene, pos : Vector2i, rot : int):
	var global_pos = map_to_local(pos)
	var instance = machine.instantiate()
	var offset = instance.set_id(selected_machine)
	var isoverlap: bool = false
	var iswater: bool = false
	
	global_pos = global_pos + ((offset/Vector2(8,8)) - Vector2(1,1)) * Vector2(8,8)
	instance.global_position = global_pos
	instance.set_rotation_degrees(rot)
	
	var write_loop = offset / Vector2(8,8)
	
	for x in write_loop.x:
		for y in write_loop.y:
			if(World.get_cell(pos + Vector2i(x,y)) != null):
				isoverlap = true
			if(is_placement_water(pos+Vector2i(x,y))):
				iswater = true
	print(iswater)
	if !isoverlap and !iswater:
		for x in write_loop.x:
			for y in write_loop.y:
				World.set_cell(instance, pos + Vector2i(x,y), rot)
		add_child(instance)
	
func set_selected_machine(id : int):
	selected_machine = id
	place_new = true

func _on_button_pressed() -> void:
	place_new = true
	get_node("FollowMouse/FollowMouseSprite").texture = machinesprite
	get_node("FollowMouse").set_visible(true)

func erase_cells(sprite: AnimatedSprite2D):
	var spritepos = local_to_map(Vector2i(sprite.position)) 
	var erase_loop = Vector2i(sprite.size_x / 8, sprite.size_y / 8)
	for x in erase_loop.x:
		for y in erase_loop.y:
			World.erase_cell(spritepos - Vector2i(x,y))
			
func is_placement_water(location: Vector2i):
	var atlascoords = groundlayer.get_cell_atlas_coords(location)
	var part1:bool = false
	var part2:bool = false
	if atlascoords.x >= 6 and atlascoords.y <= 2:
		part1 = true
	elif atlascoords.x >= 4 and atlascoords.x <= 6:
		if atlascoords.y >= 3 and atlascoords.y <= 6:
			part2 = true
	var isinwater = (part1 || part2)
	return isinwater
	
		
		
		
	
			
