extends Node2D

export(int) var targets = 16 
var used_pos = PoolVector2Array()
var target_tscn = preload("res://objects/target.tscn")
var targets_array = []
var targets_in_line = []
var current_target
onready var spawn_area = $Node2D/Ground/SpawnArea
onready var crosshair = $Node2D/Player/Crosshair
onready var crosshair_area = $Node2D/Player/Crosshair/Area2D

func _ready():
	targets=Globals.characterno
	# connet to right signal
	crosshair_area.connect("area_entered", self, "_on_crosshair_arena_enter")
	crosshair_area.connect("area_exited", self, "_on_crosshair_arena_exit")
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
			var most_front_id = 0
			for t in targets_in_line:
				most_front_id = max(most_front_id, t.id)
			
			targets_array[most_front_id].shoot(true)

func _on_crosshair_arena_enter(area):
	if area.owner in targets_array:
		if !(area.owner in targets_in_line):
			targets_in_line.append(area.owner)

func _on_crosshair_arena_exit(area):
	if area.owner in targets_array:
		if area.owner in targets_in_line:
			var t_id = targets_in_line.find(area.owner)
			targets_in_line.remove(t_id)

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
	for i in range(0, number ):
		#prints("make target number", i)
		#var pos_id = random_pos_in_spawn_area()
		var pos = random_pos_in_spawn_Area_new()
		
		if !used_pos.empty():
			while check_distance(pos, used_pos, 300):
				#pos_id = random_pos_in_spawn_area()
				pos = random_pos_in_spawn_Area_new()
		
		used_pos.append(pos)
		
		#prints("target", i, "on pos", spawn_area.polygon[pos_id])

		var target = target_tscn.instance()
		target.changeid(i)
		target.global_position=pos
		#print(spawn_area.position)
		$CharacterHolder.add_child(target)
		targets_array.append(target)
		
func randompoint():
	randomize()
	var x=randi()%int(get_viewport_rect().size.x)
	randomize()
	var y=randi()%int(get_viewport_rect().size.y)
	return(Vector2(x,y))

func random_pos_in_spawn_Area_new():
	var state=get_world_2d().direct_space_state
	var p=randompoint()
	var ar=state.intersect_point( p)
	var f=true
	while f:
		p=randompoint()
		ar=state.intersect_point(p)
		for x in ar:
			if x.collider.is_in_group('spawn_Area'):
				f=false
				break
	return p
	