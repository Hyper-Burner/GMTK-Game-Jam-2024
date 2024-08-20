extends AudioStreamPlayer
var settings = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/settings.json"))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !settings["settings"][0]["audio"]:
		volume_db = -80
