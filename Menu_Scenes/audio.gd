extends Button

@onready var settings = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/settings.json"))
var audio = true
func _ready() -> void:
	audio = settings["settings"][0]["audio"]
	if !audio:
		text = "Audio: OFF"

func _on_button_down() -> void:
	if audio:
		text = "Audio: OFF"
		audio = false
	
	elif !audio:
		text = "Audio: ON"
		audio = true
	
	settings["settings"][0]["audio"] = audio
	var json = JSON.new()
	var file = FileAccess.open("res://TextFile/settings.json", FileAccess.WRITE)
	file.store_string(json.stringify(settings))
