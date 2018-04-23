extends Node2D

var id = 0
var mouse_in = false
var death = false

func _ready():
#	randomize()
#	var r = rand_range(0, 1)
#	randomize()
#	var g = rand_range(0, 1)
#	randomize()
#	var b = rand_range(0, 1)
#	$AnimatedSprite.self_modulate = Color(r, g, b)
	randomize()
	$Timer.wait_time = rand_range(0, 2)
	$Timer.connect("timeout", $AnimationPlayer, "play", ["walk"])
	$Timer.start()
	$AnimationPlayer.connect("animation_finished", self, "_on_anim_finish")

func _on_anim_finish(anim_name):
	if anim_name == "death":
		death = true

func shoot():
	if death:
		return
		
	if $AnimationPlayer.current_animation == "death":
		return
	
	$AnimationPlayer.play("death")

	for x in $AnimatedSprite.get_children():
		x.stop()
	set_process_input(false)

		
func changeid(nid):
	id=nid
	CharacterGenerator.makechar(CharacterGenerator.characters[nid],get_node("AnimatedSprite"))


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		shoot()
		
