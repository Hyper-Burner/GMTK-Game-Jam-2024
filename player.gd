extends CharacterBody2D

@export var speed = 200

func _physics_process(_delta):
	var input_direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	velocity = input_direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())
