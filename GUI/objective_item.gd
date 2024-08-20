extends Control

@export var id: int = 0
@export var collected = 0
@export var quantity = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_properties(id, quantity):
	self.id = id
	self.quantity = quantity
	$Item.frame = id
	$Quantity.text = "0/"+str(quantity)

func update_collected(collected):
	$Quantity.text = collected+"/"+str(quantity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
