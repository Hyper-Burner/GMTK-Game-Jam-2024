extends Node
class_name machines

@onready var machines = JSON.parse_string(FileAccess.get_file_as_string("res://TextFiles/machines.json"))

var id
var input_storage_component : Array[StorageComponent]
var output_storage_component : Array[StorageComponent]
var convert_item_component : ConvertItemComponent

func _ready():
	print("Okay")
