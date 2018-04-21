extends Node2D

var id = 0
var mouse_in = false

func _ready():
	# connet to right signal
	randomize()
	var r = rand_range(0, 1)
	randomize()
	var g = rand_range(0, 1)
	randomize()
	var b = rand_range(0, 1)
	modulate = Color(r, g, b)
	randomize()
	$Timer.wait_time = rand_range(0, 2)
	$Timer.connect("timeout", $AnimationPlayer, "play", ["walk"])
	$Timer.start()
	$AnimationPlayer.connect("animation_finished", self, "_on_anim_finish")
	$AnimatedSprite/Area2D.connect("mouse_entered", self, "_on_mouse_enter")
	$AnimatedSprite/Area2D.connect("mouse_exit", self, "_on_mouse_exit")

func _on_anim_finish(anim_name):
	if anim_name == "miss":
		$AnimationPlayer.play("walk")

func _on_mouse_enter():
	mouse_in = true

func _on_mouse_exit():
	mouse_in = false

func _input(event):
	if !mouse_in:
		return
	
	if event is InputEventMouseButton:
		shoot(true)
	

func shoot(hit):
	if hit:
		$AnimationPlayer.play("death")
		set_process_input(false)
	else:
		$AnimationPlayer.play("miss")
