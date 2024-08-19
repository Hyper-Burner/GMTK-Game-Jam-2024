extends CharacterBody2D

@onready var inventory_ui = $InventoryUI
@export var speed = 200

var inventory_on = false

func _ready():
	inventory_ui.visible = true
	Global.set_player_reference(self)
	

func _physics_process(_delta):
	var input_direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	velocity = input_direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("ui_inventory"):
		var tween = create_tween()
		if inventory_on:
			tween.tween_property(inventory_ui.get_child(0), "position", Vector2(-700, 0), 0.3)
			inventory_on = false
		else:
			tween.tween_property(inventory_ui.get_child(0), "position", Vector2(0,0), 0.3)
			inventory_on = true
		
		#inventory_ui.visible = !inventory_ui.visible
