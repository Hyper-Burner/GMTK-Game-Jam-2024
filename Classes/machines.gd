extends Node2D
class_name machines

var input_storage_component : Array[StorageComponent]
var output_storage_component : Array[StorageComponent]
var convert_item_component : ConvertItemComponent
var id : int

var machines_json = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/machines.json"))
var items_json = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/items.json"))

var size_x: int
var size_y: int

var input_type = []
var input_amount = []

var bamboo_delete: Vector2i
	
func set_id(id : int):
	self.id = id
	var animated_sprite = $"."
	var machine_type
	var collision_shape = $InputComponent/CollisionShape2D
	var convert_item_component = $ConvertItemComponent
	for x in machines_json.machines:
		if(id == x.id):
			for y in x.input:
				for z in items_json.items:
					if z.name == x.input[y].name:
						convert_item_component.input.append([z.id, x.input[y].amount])
			for y in items_json.items:
				if y.name == x.output.name:
					convert_item_component.output.append(y.id)
			machine_type = x.name
			var temp_string = "item"
			var temp_int = 1
			for y in x.input:
				input_type.append(x.input[str(temp_string,temp_int)].name)
				input_amount.append(x.input[str(temp_string,temp_int)].amount)
				temp_int+= 1
			self.size_x = x.size_x * 8
			self.size_y = x.size_y * 8
	collision_shape.shape.extents = Vector2(size_x, size_y)
	animated_sprite.play(machine_type)
	return Vector2(size_x, size_y)
	
func get_size():
	return size_x
