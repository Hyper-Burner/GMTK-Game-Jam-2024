extends TileMapLayer
@export var machine = preload("res://conveyor.tscn")

var place_new = false # Set this to true when there is a new node created to move
var node_to_move # Change the node this is linked to when there is a new node to place
var direction = 0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rotate"):
		direction += 90

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and place_new:
		var location = local_to_map(get_global_mouse_position())
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if World.get_cell(location) == null:
				place_machine(machine, location, direction)
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			World.erase_cell(location)

func place_machine(machine: PackedScene, pos : Vector2i, rot : int):
	var global_pos = map_to_local(pos)
	var instance = machine.instantiate()
	instance.global_position = global_pos
	instance.set_rotation_degrees(rot)
	World.set_cell(instance, pos, rot)
	add_child(instance)

func _on_button_pressed() -> void:
	var obj = machine.instantiate()
	node_to_move = obj
	place_new = true
	add_child(obj)
