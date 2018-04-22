extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var thread
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$CanvasLayer/Sprite.position=get_viewport().get_texture().get_size()/2

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pa
func loadscn(path):
	thread=Thread.new()
	thread.start(self,'fadeloader',path)
func fadeloader(path):
	
	var scn=load(path)
	var t=get_viewport().get_texture().get_data()
	t.flip_y()
	var im=ImageTexture.new()
	im.create_from_image(t)
	$CanvasLayer/Sprite.texture=im
	$CanvasLayer/Sprite.self_modulate.a=1
	yield(get_tree(),'idle_frame')
	get_tree().change_scene_to(scn)
	$CanvasLayer/AnimationPlayer.play("fade")