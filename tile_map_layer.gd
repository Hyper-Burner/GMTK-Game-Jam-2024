extends TileMapLayer
@export var machine = preload("res://Classes/machine.tscn")
var machinesprite = preload("res://test.PNG")

var place_new = false # Set this to true when there is a new node created to move
var node_to_move # Change the node this is linked to when there is a new node to place
var direction = 0
var radius = 251

var hold_button: bool = false # Checks to see if button is held down during building

var mouse_direction
var mouse_pos_cur
var mouse_pos_next

func _ready() -> void:
	mouse_pos_next = get_global_mouse_position()
	

func _process(delta: float) -> void:
	
	mouse_pos_cur = mouse_pos_next
	mouse_pos_next = get_global_mouse_position()
	mouse_direction = mouse_pos_next - mouse_pos_cur
	mouse_direction = mouse_direction.angle()/(PI/180) + 90
	mouse_direction = round(mouse_direction /90) * 90
	
	if Input.is_action_just_pressed("rotate"):
		direction += 90
		get_node("FollowMouse").rotation_degrees += 90
	if hold_button:
		var location = local_to_map(get_global_mouse_position())
		if(Input.is_action_pressed("left_click")):
			if World.get_cell(location) == null and location.x <= radius and location.x >= -radius and location.y <= radius and location.y >= -radius:
				place_machine(machine, location, mouse_direction)
		elif(Input.is_action_pressed("right_click")):
			World.erase_cell(location);

	if place_new:
		var location = local_to_map(get_global_mouse_position())
		print(location)
		get_node("FollowMouse").position = Vector2(location.x * 16 + 8, location.y * 16 + 8)
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and place_new:
		if event.button_index == MOUSE_BUTTON_LEFT or MOUSE_BUTTON_RIGHT and event.is_pressed():
			var location = local_to_map(get_global_mouse_position())
			if World.get_cell(location) == null and location.x <= radius and location.x >= -radius and location.y <= radius and location.y >= -radius:
				place_machine(machine, location, direction)
			hold_button = true
		elif event.button_index == MOUSE_BUTTON_LEFT or MOUSE_BUTTON_RIGHT and event.is_released():
			hold_button = false


func place_machine(machine: PackedScene, pos : Vector2i, rot : int):
	var global_pos = map_to_local(pos)
	var instance = machine.instantiate()
	instance.global_position = global_pos
	instance.set_rotation_degrees(rot)
	World.set_cell(instance, pos, rot)
	add_child(instance)

func _on_button_pressed() -> void:
	place_new = true
	print(machinesprite)
	get_node("FollowMouse/FollowMouseSprite").texture = machinesprite
	get_node("FollowMouse").set_visible(true)
