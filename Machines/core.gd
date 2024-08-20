extends Area2D

var objectives = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/objectives.json"))

@onready var storage = $StorageComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	storage.add_item(0)
	storage.add_item(1)
	print(storage.items)
	print(objectives[Global.planet_level])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_objectives()
	
func check_objectives():
	for key in storage.items:
		var value = storage.items[key]
		if value < objectives[Global.planet_level][key].amount:
			return false
		pass
	
