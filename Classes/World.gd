extends Node

var world = {}

func set_cell(obj: Node, pos : Vector2i, rot: int):
	world[pos] = [obj, rot]

func size():
	return world.size()

func get_cell(coords : Vector2i):
	if world.has(coords):
		return world[coords]

func erase_cell(coords : Vector2i):
	if get_cell(coords) != null:
		world[coords][0].queue_free()
		world[coords] = null
