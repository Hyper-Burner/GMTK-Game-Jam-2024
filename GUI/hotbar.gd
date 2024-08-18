extends Control

var open = true


func _on_texture_button_pressed() -> void:
	var tween = get_tree().create_tween()
	if open:
		tween.tween_property(self, "position", Vector2(0, 77), 0.25)
		open = false
	else:
		tween.tween_property(self, "position", Vector2(0, 0), 0.25)
		open = true
