extends Spatial

func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("mouse_left"):
		get_tree().change_scene("res://objects/main.tscn")