extends Area2D
class_name Item

@onready var items = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/items.json"))

@export var id : int

var speed = Vector2(0, 0)
var on_conveyor = false

func _ready() -> void:
	pass
	#print(items["items"])

func set_id(id : int):
	self.id = id
	$Sprite2D.frame = id

func tween_position(final_val, duration : float):
	var tween = create_tween()
	print(final_val);
	tween.tween_property(self, "position", final_val, duration)
	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('left_click'):
			var pickup = {
				"name" : items.items[id].name,
				"id" : id,
				"quantity" : 1,
				"description" : items.items[id].description
			}
			Global.add_item(pickup)
			queue_free()
		
