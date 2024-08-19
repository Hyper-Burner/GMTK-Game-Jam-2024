extends Node2D
class_name machines

var input_storage_component : Array[StorageComponent]
var output_storage_component : Array[StorageComponent]
var convert_item_component : ConvertItemComponent
var id : int

var file = "res://TextFile/machines.json"
var json_as_text = FileAccess.get_file_as_string(file)
var json_as_dict = JSON.parse_string(json_as_text)

var size_x: int
var size_y: int

var input_type = []
var input_amount = []

var bamboo_delete: Vector2i
	
func set_id(id : int):
	self.id = id
	var animated_sprite = $"."
	var size = $InputComponent/CollisionShape2D
	var machine_type
	for x in json_as_dict.machines:
		if(id == x.id):
			machine_type = x.name
			var temp_string = "item"
			var temp_int = 1
			for y in x.input:
				input_type.append(x.input[str(temp_string,temp_int)].name)
				input_amount.append(x.input[str(temp_string,temp_int)].amount)
				temp_int+= 1
			self.size_x = x.size_x * 8
			self.size_y = x.size_y * 8
	size.shape.extents = Vector2(size_x, size_y)
	animated_sprite.play(machine_type)
	return Vector2(size_x, size_y)
	
func get_size():
	return size_x
