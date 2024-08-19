extends Sprite2D

func _ready() -> void:
	while modulate.a > 0:
		await get_tree().create_timer(0.01).timeout
		modulate.a -= 0.05
	queue_free()
