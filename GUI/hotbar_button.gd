extends TextureButton

@onready var label = $Label
var textureSheet = preload("res://items-Sheet.png")
signal selected_machine(machine)

var machine_json = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/machines.json"))
var item_json = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/items.json"))
@export var id : int = 0

func set_machine_id(id):
	var count = 1
	self.id = id
	for x in machine_json["machines"]:
		if x["id"] == id:
			$Label.text = x["name"].replace("_", " ") + "\n" + "Cost:\n"
			$AnimatedSprite2D.animation = x["name"]
			for y in x["cost"]:
				$Label.text = $Label.text + str(x["cost"]["item" + str(count)]["amount"])
				$Label.text = $Label.text + " " + x["cost"]["item" + str(count)]["name"].replace("_", " ") + "\n"
				
				var item = 0
				for i in item_json["items"]:
					if i["name"] == x["cost"]["item" + str(count)]["name"]:
						item = int(i["id"])
				var new_control = Control.new()
				var costInstance = Sprite2D.new()
				var sprite_x = (item % 16) * 8
				var sprite_y = (item / 16) * 8
				costInstance.texture = textureSheet
				costInstance.region_enabled = true
				costInstance.region_rect = Rect2(Vector2(sprite_x, sprite_y), Vector2(8,8))
				new_control.add_child(costInstance)
				$HBoxContainer.add_child(new_control)
				
				count = count + 1
	

func _on_pressed() -> void:
	get_tree().call_group("World", "set_selected_machine", id)


func _on_mouse_entered() -> void:
	label.visible = true


func _on_mouse_exited() -> void:
	label.visible = false
