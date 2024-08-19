extends Control

@onready var icon = $OuterBorder/ItemIcon
@onready var quantity_label = $OuterBorder/ItemQuantity
@onready var details_panel = $DetailsPanel
@onready var item_name = $DetailsPanel/ItemName

var item = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	details_panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _proceess(delta: float) -> void:
	pass


func _on_item_button_pressed() -> void:
	pass # Replace with function body.


func _on_item_button_mouse_entered() -> void:
	if item != null:
		details_panel.visible = true


func _on_item_button_mouse_exited() -> void:
	details_panel.visible = false

func set_empty():
	icon.texture = null
	quantity_label.text = ""
	item_name.text = ""
	
func set_item(new_item):
	item = new_item
	icon.frame = item.id
	quantity_label.text = str(item.quantity)
	item_name.text = str(Global.convert_named_item(item.name))
	
