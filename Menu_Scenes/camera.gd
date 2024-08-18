extends Camera2D

var planet1: String = "res://Planets/Planet1.tscn"
var planet2: String = "res://Planets/Planet2.tscn"
var planet3: String = "res://Planets/Planet3.tscn"
# export character and ui here

func fade_to_black() -> void: # fade screen to black before title display
	get_node("BlackScreen").visible = true
	var screenNode = get_parent().get_node("Background")
	var button_list = screenNode.get_children()
	for but in button_list:
		but.disabled = true
	while screenNode.modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		screenNode.modulate.a -= 0.05

func display_title(toDisplay: String) -> void: # display title char by char
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

func load_scene(loadPlanet: String) -> void: # load scene after click on planet
	get_parent().get_parent().add_child(load(loadPlanet).instantiate())
	# load character and ui here
	get_parent().queue_free()

func _on_planet_1_button_down() -> void:
	fade_to_black()
	display_title("Planet 1:\nα-736")
	await get_tree().create_timer(7).timeout
	load_scene(planet1)

func _on_planet_2_button_down() -> void:
	fade_to_black()
	display_title("Planet 2:\nβ-241")
	await get_tree().create_timer(7).timeout
	load_scene(planet2)

func _on_planet_3_button_down() -> void:
	fade_to_black()
	display_title("Planet 3:\nΣ-128")
	await get_tree().create_timer(7).timeout
	load_scene(planet3)
