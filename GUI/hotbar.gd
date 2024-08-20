extends Control

var open = true
var unlocks = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/unlocks.json"))
var objectives = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/objectives.json"))
var hotbar_button = preload("res://GUI/hotbar_button.tscn")
var objective_item = preload("res://GUI/objective_item.tscn")

func _ready() -> void:
	var conveyorbelt = hotbar_button.instantiate()
	conveyorbelt.set_machine_id(4)
	$HBoxContainer.add_child(conveyorbelt)
	
	for x in range(1, unlocks[Global.planet_level]):
		var instance = hotbar_button.instantiate()
		instance.set_machine_id(x)
		$HBoxContainer.add_child(instance)
	print(objectives[Global.planet_level])
	for i in range(0, len(objectives[Global.planet_level])):
		var objective_instance = objective_item.instantiate()
		objective_instance.set_properties(objectives[Global.planet_level][i].id,objectives[Global.planet_level][i].amount)
		$"../Objective/ObjectivesList".add_child(objective_instance)
	
	

func _on_texture_button_pressed() -> void:
	var tween = get_tree().create_tween()
	if open:
		tween.tween_property(self, "position", Vector2(0, 77), 0.25)
		open = false
	else:
		tween.tween_property(self, "position", Vector2(0, 0), 0.25)
		open = true
