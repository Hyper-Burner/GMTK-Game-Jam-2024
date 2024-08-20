extends Node

var inventory = []
var planet_level = 0
var player_node: Node = null

signal inventory_updated
signal update_objective_progress
signal show_details


var items_json = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/items.json"))
@onready var inventory_slot_scene = preload("res://inventory_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.resize(20)
	for x in items_json.items:
		x.merge({"quantity": 0})
		self.add_item(x)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["name"] == item["name"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			#print("Item added", inventory)
			return true
	for i in range(inventory.size()):
		if inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			#print("Item added", inventory)
			return true
	return false

#Only use this for subtracting and not adding new things to inventory
func to_item(quantity: int, name: String):
	return {"quantity": quantity, "name": name}

func remove_item():
	inventory_updated.emit()

func set_player_reference(player):
	player_node = player
	
func convert_named_item(name):
	var str = ""
	for i in range(len(name)):
		if name[i] == "_":
			str = str + " "
		else:
			str = str + name[i]
	return str
	
func update_objectives(items):
	update_objective_progress.emit(items)
