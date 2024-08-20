extends Area2D

var objectives = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/objectives.json"))

@onready var storage = $StorageComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#for i in range(0, 50):
		#storage.add_item(0)
	#for i in range(0, 40):
		#storage.add_item(1)
	#for i in range(0,30):
		#storage.add_item(2)
	#for i in range(0,10):
		#storage.add_item(3)
	#print(storage.items)
	#print(objectives[Global.planet_level])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func check_objectives():
	var obj = {}
	for i in objectives[Global.planet_level]:
		obj[i.id] = i.amount
	
	for i in obj:
		for j in storage.items:
			if (i == j and obj[i] > storage.items[j]):
				return false
	return true
	
