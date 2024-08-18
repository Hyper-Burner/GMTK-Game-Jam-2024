extends CharacterBody2D

@onready var inventory_ui = $InventoryUI
const speed = 200

func _ready():
	Global.set_player_reference(self)
	

func _physics_process(_delta):
	var input_direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	velocity = input_direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("ui_inventory"):
		inventory_ui.visible = !inventory_ui.visible
	
