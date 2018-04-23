extends Spatial


func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("mouse_left") or Input.is_action_just_pressed("ui_cancel"):
		
		loader.loadscn("main")

func _on_AnimationPlayer_animation_finished(anim_name):
	loader.loadscn("main")
