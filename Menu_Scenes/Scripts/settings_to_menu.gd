extends Node

func _on_button_down() -> void:
	get_parent().visible = false
	get_parent().get_parent().get_node("Menu").visible = true
