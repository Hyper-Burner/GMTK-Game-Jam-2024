extends Button

func _on_button_down() -> void:
	set_visible(false)
	get_node("/root/resource/FollowMouse").set_visible(false)
	get_node("/root/resource").place_new = false

func _on_mouse_entered() -> void:
	get_node("/root/resource").place_new = false

func _on_mouse_exited() -> void:
	get_node("/root/resource").place_new = true
