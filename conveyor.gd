extends AnimatedSprite2D
class_name conveyor

@export var storage_component : StorageComponent

var conveyor_speed = 1

var id

var size_x: int
var size_y: int

		
func set_id(useless):
	id = 4
	size_x = 8
	size_y = 8
	return Vector2(size_x,size_y)


func _on_conveyor_area_entered(area: Area2D) -> void:
	if area is Item:
		area.tween_position($Marker2D.global_position, conveyor_speed)
