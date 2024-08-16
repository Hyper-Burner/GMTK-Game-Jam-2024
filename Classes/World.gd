extends Node

var world = [[]]

func set_cell(obj: Node, pos : Vector2i, rot: int):
	if pos.x > world.size() - 1:
		world.resize(pos.x + 1)
		world[pos.x] = []
		world[pos.x].resize(pos.y + 1)
	elif world[pos.x] == null:
		world[pos.x] = []
	if pos.y > world[pos.x].size() - 1:
		world[pos.x].resize(pos.y + 1)
	world[pos.x][pos.y] = {"obj": obj,"rot": rot}

func size():
	return world.size()

func get_cell(coords : Vector2i):
	var x = coords.x
	var y = coords.y
	if x > world.size() - 1 or world[x] == null or y > world[x].size() - 1:
		return null
	return world[x][y]

func erase_cell(coords : Vector2i):
	var x = coords.x
	var y = coords.y
	if get_cell(coords) != null:
		world[coords.x][coords.y]["obj"].queue_free()
		world[coords.x][coords.y] = null
