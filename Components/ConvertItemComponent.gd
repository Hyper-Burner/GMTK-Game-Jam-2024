extends Node
class_name ConvertItemComponent

@export var inputs : Array[StorageComponent]
@export var outputs : Array[StorageComponent]
@export var input : Array[Array]
@export var output : Array[int]

@onready var timer = $Timer

func _physics_process(delta):
	#if input == inputs[0].items.keys():
	#	timer.paused = false
	#else:
	#	timer.paused = true
	pass

func _on_timer_timeout():
	for item in input:
		for x in range(item[1]):
			inputs[0].remove_item(item[0])
	#outputs[0].add_item(output[0])
