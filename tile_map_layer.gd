extends TileMapLayer
@export var machine = preload("res://Machines/machine_1.tscn")


var place_new = false # Set this to true when there is a new node created to move
var node_to_move # Change the node this is linked to when there is a new node to place

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if place_new == true:
		node_to_move.modulate.a = 0.5
		var mouse_pos = get_global_mouse_position()
		var tile_pos = local_to_map(mouse_pos)
		node_to_move.position = Vector2(tile_pos.x * 16 + 8,tile_pos.y * 16 + 8)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and place_new:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			node_to_move.modulate.a = 1
			place_new = false
			
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed and place_new == true:
			node_to_move.rotation -= PI/2

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed and place_new == true:
			node_to_move.rotation += PI/2
			
			
func _on_button_pressed() -> void:
	var obj = machine.instantiate()
	node_to_move = obj
	place_new = true
	add_child(obj)
