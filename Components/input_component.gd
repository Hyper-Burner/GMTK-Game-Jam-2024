extends Node
class_name InputComponent

@export var storage_component : StorageComponent
@export var item_filter : int


func _on_area_entered(area: Area2D) -> void:
	if area is Item and storage_component.add_item(area.id):
		area.queue_free()
