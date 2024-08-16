extends Node

@export var inputs : Array[StorageComponent]
@export var outputs : Array[StorageComponent]
@export var input : Array[int]
@export var output : Array[int]

@onready var timer = $Timer

func _physics_process(delta):
	if input == inputs[0].items.keys():
		timer.paused = false
	else:
		timer.paused = true

func _on_timer_timeout():
	for item in input:
		inputs[0].remove_item(item)
		outputs[0].add_item(output[0])
