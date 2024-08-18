extends Node

var inventory = []
var player_node: Node = null

signal inventory_updated

@onready var inventory_slot_scene = preload("res://inventory_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory.resize(20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_item(item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i]["name"] == item["name"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			print("Item added", inventory)
			return true
		elif inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			print("Item added", inventory)
			return true
		return false
	

func remove_item():
	inventory_updated.emit()

func set_player_reference(player):
	player_node = player
