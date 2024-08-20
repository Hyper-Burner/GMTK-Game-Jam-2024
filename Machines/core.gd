extends AnimatedSprite2D

var completed_objective:bool = false
var objectives = JSON.parse_string(FileAccess.get_file_as_string("res://TextFile/objectives.json"))
@onready var hitbox = $InputComponent/CollisionShape2D
@onready var storage = $StorageComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.play(str(Global.planet_level))
	match Global.planet_level:
		0:
			hitbox.shape.extents = Vector2(24,24)
		1:
			hitbox.shape.extents = Vector2(24,24)
		2:
			hitbox.shape.extents = Vector2(32,32)
			
	#for i in range(0, 50):
		#storage.add_item(0)
	#for i in range(0, 40):
		#storage.add_item(1)
	#for i in range(0,30):
		#storage.add_item(2)
	#for i in range(0,10):
		#storage.add_item(3)
	#print(storage.items)
	#print(objectives[Global.planet_level])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var completed: bool = check_objectives()
	if(completed):
		completed_objective = true
		match Global.planet_level:
			0:
				self.play("teleporter")
			1:
				self.play("portal")
			2:
				self.play("starting_rocket")


	
func check_objectives():
	Global.update_objectives(storage.items)
	var obj = {}
	for i in objectives[Global.planet_level]:
		obj[i.id] = i.amount
	
	var enough:bool = false
	for item in storage.items:
		if(item != null):
			for y in obj:
				if(y == item):
					if(obj[y] >= int(storage.items[item])):
						return false
					enough = true
	return enough
