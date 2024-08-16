extends Marker2D
class_name OutputComponent

@export var storage : StorageComponent
var items = preload("res://Classes/Items.tscn")

func _on_timer_timeout():
	var local_position = local_to_map(global_position)
	if storage.items.size() and World.get_cell(local_position) != null and World.get_cell(local_position)["obj"]:
		var data = storage.remove_item()
		var item = items.instantiate()
		item.set_id(data)
		item.position = global_position
		get_node("/root/Node/Items").add_child(item)

func local_to_map(local_position : Vector2):
	return Vector2i(local_position / Vector2(16, 16))
