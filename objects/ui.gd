extends Node



func _on_start_pressed():
	print("start awesome game!")
	$menu/ui.hide()


func _on_options_pressed():
	print("options")


func _on_quit_pressed():
	get_tree().quit()
