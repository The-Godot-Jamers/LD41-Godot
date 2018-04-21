extends Node2D

var id = 0

func _ready():
	# connet to right signal
	randomize()
	$Timer.wait_time = rand_range(0, 2)
	$Timer.connect("timeout", $AnimationPlayer, "play", ["walk"])
	$Timer.start()
	$HitBox.hide()
	pass

func in_hit_box(pos):
	return pos in $HitBox.polygon

func shoot(hit):
	if hit:
		$AnimationPlayer.play("death")
	else:
		$AnimationPlayer.play("miss")
