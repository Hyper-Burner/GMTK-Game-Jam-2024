extends Camera2D

func fade_to_black() -> void:
	var screenNode = get_parent().get_node("Background")
	var button_list = screenNode.get_children()
	for but in button_list:
		but.disabled = true
	while screenNode.modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		screenNode.modulate.a -= 0.05

func _on_planet_1_button_down() -> void:
	fade_to_black()
	# Link to Planet 1 Scene here

func _on_planet_2_button_down() -> void:
	fade_to_black()
	# Link to Planet 2 Scene here

func _on_planet_3_button_down() -> void:
	fade_to_black()
	# Link to Planet 3 Scene here
