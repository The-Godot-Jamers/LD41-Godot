extends Node

export(int) var targets = 30
var used_pos = PoolVector2Array()
var target_tscn = preload("res://objects/target.tscn")
var targets_array = []
var current_target
onready var spawn_area = $Node2D/Ground/SpawnArea
onready var crosshair = $Node2D/Player/Crosshair

func _ready():
	# connet to right signal
	spawn_area.hide()
	spawn_targets(targets)
	_on_card_shoot(0)

func _on_card_shoot(index):
	current_target = targets_array[index]
	crosshair.show()

func _input(event):
	if !crosshair.visible:
		return
		
	if event is InputEventMouse:
		crosshair.global_position = event.global_position
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			var hit = current_target.in_hit_box(crosshair.position)
			current_target.shoot(hit)
			prints("shoot", current_target.id, hit)
			

func random_pos_in_spawn_area():
	randomize()
	return int(rand_range(0, spawn_area.polygon.size()))

func check_distance(pos, array, distance):
	for a in array:
		if pos.distance_to(a) < distance:
			continue
		else:
			return false
	return true


func spawn_targets(number):
	used_pos = []
	for i in range(0, number - 1):
		#prints("make target number", i)
		var pos_id = random_pos_in_spawn_area()
		var pos = spawn_area.polygon[pos_id]
		
		if !used_pos.empty():
			while check_distance(pos, used_pos, 25):
				pos_id = random_pos_in_spawn_area()
				pos = spawn_area.polygon[pos_id]
		
		used_pos.append(pos)
		
		#prints("target", i, "on pos", spawn_area.polygon[pos_id])

		var target = target_tscn.instance()
		target.id = i
		target.position = spawn_area.global_position
		target.position += spawn_area.polygon[pos_id]
		#print(spawn_area.position)
		add_child(target)
		targets_array.append(target)

		
