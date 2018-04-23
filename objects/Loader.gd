extends Node2D

var _3d = load("res://3d.tscn")
var _2d = load("res://2d.tscn")
var main1 = load("res://main.tscn")
var main = load("res://objects/main.tscn")

func _ready():
	pass


func loadscn(scene):
	if $CanvasLayer/AnimationPlayer.is_playing():
		pass
	else:
		fadeloader(scene)

func fadeloader(scene):
	var t = get_viewport().get_texture().get_data()
	t.flip_y()
	yield(get_tree(),'idle_frame')
	$CanvasLayer/AnimationPlayer.play("fade")
	if scene == "_2d":
		get_tree().change_scene_to(_2d)
	elif scene == "_3d":
		get_tree().change_scene_to(_3d)
	elif scene == "main1":
		get_tree().change_scene_to(main1)
	elif scene == "main":
		get_tree().change_scene_to(main)
	