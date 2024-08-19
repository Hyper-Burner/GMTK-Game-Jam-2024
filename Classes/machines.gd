extends Node
class_name machines

@export var machine_type: String
@onready var animated_sprite = $"."
var input_storage_component : Array[StorageComponent]
var output_storage_component : Array[StorageComponent]
var convert_item_component : ConvertItemComponent

var input_type = []
var input_amount = []

func _ready():
	var file = "res://TextFile/machines.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	animated_sprite.play(machine_type)
	for x in json_as_dict.machines:
		if(machine_type == x.name):
			var temp_string = "item"
			var temp_int = 1
			for y in x.input:
				input_type.append(x.input[str(temp_string,temp_int)].name)
				input_amount.append(x.input[str(temp_string,temp_int)].amount)
				temp_int+= 1
			print(input_type)
			print(input_amount)
