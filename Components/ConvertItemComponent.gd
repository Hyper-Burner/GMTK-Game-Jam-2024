extends Node
class_name ConvertItemComponent

@export var inputs : Array[StorageComponent]
@export var outputs : Array[StorageComponent]
@export var input : Array[Array]
@export var output : Array[int]

@onready var timer = $Timer

func _physics_process(delta):
	var flag = true
	for x in input:
		print(inputs[0].items.has(int(x[0])))
		print(inputs[0].items)
		print(x[0])
		if !inputs[0].items.has(int(x[0])) or !inputs[0].items[int(x[0])] >= x[1]:
			flag = false
	#print(flag)
	if flag:
		timer.paused = false
	else:
		timer.paused = true

func _on_timer_timeout():
	for item in input:
		for x in range(item[1]):
			inputs[0].remove_item(int(item[0]))
	outputs[0].add_item(output[0])
