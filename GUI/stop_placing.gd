extends Button

func _on_button_down() -> void:
	set_visible(false)
	get_node("/root/resource/FollowMouse").set_visible(false)
	get_node("/root/resource").place_new = false
