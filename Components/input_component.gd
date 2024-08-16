extends Node
class_name InputComponent

@export var storage_component : StorageComponent

func _on_area_entered(area):
	if area is Item and storage_component.add_item(area.id):
		area.queue_free()
