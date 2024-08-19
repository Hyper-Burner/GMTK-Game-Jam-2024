extends Control

var open = true
var unlocks = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/unlocks.json"))
var hotbar_button = preload("res://GUI/hotbar_button.tscn")

func _ready() -> void:
	for x in range(unlocks[Global.planet_level]):
		var instance = hotbar_button.instantiate()
		instance.set_machine_id(x)
		$HBoxContainer.add_child(instance)

func _on_texture_button_pressed() -> void:
	var tween = get_tree().create_tween()
	if open:
		tween.tween_property(self, "position", Vector2(0, 77), 0.25)
		open = false
	else:
		tween.tween_property(self, "position", Vector2(0, 0), 0.25)
		open = true
