extends Node

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		$ui/menu/ui.visible = !$ui/menu/ui.visible
	if Input.is_action_just_pressed("ui_focus_prev"):
		get_tree().reload_current_scene()
