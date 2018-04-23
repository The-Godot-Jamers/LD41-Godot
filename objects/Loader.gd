extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var thread
var scn
func _ready():
	$CanvasLayer/Sprite.position=get_viewport().get_texture().get_size()/2

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pa
func loadscn(path):
	if $CanvasLayer/AnimationPlayer.is_playing():
		pass
	else:
		fadeloader(path)
func fadeloader(path):
	scn=load(path)
	var t=get_viewport().get_texture().get_data()
	t.flip_y()
	var im=ImageTexture.new()
	im.create_from_image(t)
	$CanvasLayer/Sprite.texture=im
	$CanvasLayer/Sprite.self_modulate.a=1
	yield(get_tree(),'idle_frame')
	$CanvasLayer/AnimationPlayer.play("fade")
	get_tree().change_scene_to(scn)
	
