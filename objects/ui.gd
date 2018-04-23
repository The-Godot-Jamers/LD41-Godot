extends Node

func _on_start_pressed():
	#print("start awesome game!")
	$menu/ui.hide()

func _on_options_pressed():
	#print("options")
	pass

func _on_quit_pressed():
	get_tree().quit()

func _input(event):
	if Input.is_action_just_pressed("1"):
		$debug/ui.visible = !$debug/ui.visible