extends TextureButton

signal selected_machine(machine)

var machine_json = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/machines.json"))
@export var id : int = 0

func _ready():
	set_machine_id(id)

func set_machine_id(id):
	self.id = id
	for x in machine_json["machines"]:
		if x["id"] == id:
			$Label.text = x["name"]

func _on_pressed() -> void:
	get_tree().call_group("World", "set_selected_machine", id)
