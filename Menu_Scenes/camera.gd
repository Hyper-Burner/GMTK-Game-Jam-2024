extends Camera2D

func fade_to_black() -> void:
	get_node("BlackScreen").visible = true
	var screenNode = get_parent().get_node("Background")
	var button_list = screenNode.get_children()
	for but in button_list:
		but.disabled = true
	while screenNode.modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		screenNode.modulate.a -= 0.05

func display_title(toDisplay: String) -> void:
	await get_tree().create_timer(1).timeout
	var title = get_node("Title")
	title.visible = true
	var text = ""
	for letter in toDisplay:
		text += letter
		title.text = "[center]" + text + "[/center]"
		await get_tree().create_timer(0.2).timeout
	await get_tree().create_timer(1.5).timeout
	while title.modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		title.modulate.a -= 0.05

func _on_planet_1_button_down() -> void:
	fade_to_black()
	display_title("Planet 1:\nα-736")
	await get_tree().create_timer(7).timeout
	get_tree().change_scene_to_file("res://Planets/Planet1.tscn")

func _on_planet_2_button_down() -> void:
	fade_to_black()
	display_title("Planet 2:\nβ-241")
	await get_tree().create_timer(7).timeout
	# Link to Planet 2 Scene here

func _on_planet_3_button_down() -> void:
	fade_to_black()
	display_title("Planet 3:\nΣ-128")
	await get_tree().create_timer(7).timeout
	# Link to Planet 3 Scene here
