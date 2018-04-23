extends Node2D

var thread
var scn

func _ready():
	thread=Thread.new()
	#$CanvasLayer/Label.position = get_viewport().get_texture().get_size()/2


func loadscn(path):
	if $CanvasLayer/AnimationPlayer.is_playing():
		pass
	else:
		fadeloader(path)

func fadeloader(path):
	scn = load(path)
	var t = get_viewport().get_texture().get_data()
	t.flip_y()
	yield(get_tree(),'idle_frame')
	$CanvasLayer/AnimationPlayer.play("fade")
	get_tree().change_scene_to(scn)