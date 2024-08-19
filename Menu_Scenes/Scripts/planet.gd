extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate.a = 0

func _on_mouse_entered() -> void:
	scale = Vector2(1.25, 1.25)


func _on_mouse_exited() -> void:
	scale = Vector2(1, 1)
