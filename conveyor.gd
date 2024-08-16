extends Area2D
class_name conveyor

@export var storage_component : StorageComponent
var conveyor_speed = 1000

func _on_area_entered(area):
	if area is Item and storage_component.is_full() == false:
		area.tween_position($Marker2D.global_position - storage_component.get_number_of_stacks() * 3, conveyor_speed)
