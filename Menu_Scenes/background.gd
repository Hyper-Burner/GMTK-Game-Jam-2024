extends Sprite2D

func _ready() -> void:
	modulate.a = 0
	while modulate.a < 1:
		await get_tree().create_timer(0.01).timeout
		modulate.a += 0.025
