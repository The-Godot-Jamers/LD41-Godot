extends Node

export(int) var targets = 30 

var target_tscn = preload("res://objects/target.tscn")
onready var spawn_area = $Node2D/Ground/SpawnArea

func _ready():
	# connet to right signal
	spawn_area.hide()
	spawn_targets(30)

func _on_card_shoot(index, hit):
	$AnimationPlayer.play("shoot")

func random_pos_in_spawn_area(start = 0):
	randomize()
	return int(rand_range(start, spawn_area.polygon.size()))

func spawn_targets(number):
	for i in range(0, number):
		#prints("make target number", i)
		var pos_id = random_pos_in_spawn_area()
		#prints("target", i, "on pos", spawn_area.polygon[pos_id])

		var target = target_tscn.instance()
		target.id = i
		target.position = spawn_area.global_position
		target.position += spawn_area.polygon[pos_id]
		#print(spawn_area.position)
		add_child(target)

		
