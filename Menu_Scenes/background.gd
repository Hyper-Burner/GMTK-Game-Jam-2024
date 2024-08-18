extends Sprite2D

func _ready() -> void:
	modulate.a = 0
	var button_list = get_children()
	for but in button_list:
		but.disabled = true
	while modulate.a < 1:
		await get_tree().create_timer(0.01).timeout
		modulate.a += 0.025
	
	for but in button_list:
		but.disabled = false
