extends Node

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		$UI/menu/ui.visible = !$UI/menu/ui.visible
	if Input.is_action_just_pressed("ui_focus_prev"):
		get_tree().reload_current_scene()
