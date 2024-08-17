extends Area2D
class_name Item

var id
var speed = Vector2(0, 0)
var on_conveyor = false

func set_id(id : int):
	self.id = id
	$Sprite2D.frame = id

func tween_position(final_val, duration : float):
	var tween = create_tween()
	print(final_val);
	tween.tween_property(self, "position", final_val, duration)
