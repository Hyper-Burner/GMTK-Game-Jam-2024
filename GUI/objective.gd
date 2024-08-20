extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.update_objective_progress.connect(_on_objective_update)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_objective_update(items):
	for item in $ObjectivesList.get_children():
		item.update_collected(items)
	pass
	
