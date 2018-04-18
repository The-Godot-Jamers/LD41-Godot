extends Node

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if $UI/menu/ui.is_visible():
			$UI/menu/ui.hide()
		else:
			$UI/menu/ui.show()
	if Input.is_action_just_pressed("ui_focus_prev"):
		get_tree().reload_current_scene()
