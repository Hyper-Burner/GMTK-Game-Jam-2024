extends Control

@onready var grid_container = $GridContainer
@onready var item_name = $ItemName
@onready var item_desc = $ItemDescription

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.inventory_updated.connect(_on_inventory_updated)
	Global.show_details.connect(_on_show_details)
	_on_inventory_updated()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_inventory_updated():
	clear_grid_container()
	for item in Global.inventory:
		var slot = Global.inventory_slot_scene.instantiate()
		grid_container.add_child(slot)
		if item != null:
			slot.set_item(item)
		else:
			slot.set_empty()
	
func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()

func _on_show_details(name, desc):
	item_name.text = name
	item_desc.text = desc
