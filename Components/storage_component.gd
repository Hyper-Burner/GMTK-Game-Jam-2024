extends Node
class_name StorageComponent

@export var items : Dictionary
@export var storage_size : int
@export var stack_size : int

func add_item(item : int):
	if get_number_of_stacks() < storage_size:
		var key = items.get(item)
		if key is int:
			self.items[item] += 1
		else:
			self.items[item] = 1
		return true
	return false

func remove_item(item = -1):
	if item == -1:
		item = items.keys().max()
		if item == null:
			return -1
	if items[item] > 1:
		items[item] -= 1
	else:
		items.erase(item)
	return item

func get_number_of_stacks():
	var stacks = 0
	for item in items:
		stacks += ceil(item / stack_size)
	return stacks
