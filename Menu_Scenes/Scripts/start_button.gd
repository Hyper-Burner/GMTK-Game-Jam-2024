extends TextureButton

func _on_button_down() -> void:
	var screenNode = get_parent().get_parent()
	var settingsButton = get_parent().get_children().filter(func(child):
		return child != self)
	settingsButton[0].disabled = true
	disabled = true
	while screenNode.modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		screenNode.modulate.a -= 0.05
	get_tree().change_scene_to_file("res://Menu_Scenes/Scenes/planets.tscn")
