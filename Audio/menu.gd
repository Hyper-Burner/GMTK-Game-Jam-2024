extends AudioStreamPlayer
var settings = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/settings.json"))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !settings["settings"][0]["audio"]:
		volume_db = -80

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	settings = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/settings.json"))
	if !settings["settings"][0]["audio"]:
		volume_db = -80
	elif settings["settings"][0]["audio"]:
		volume_db = -5
