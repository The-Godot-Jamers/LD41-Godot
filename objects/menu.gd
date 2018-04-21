extends VBoxContainer

func _ready():
	$StartButton/start.connect("pressed", self, "_on_start")
	$OptionsButton/options.connect("pressed", self, "_on_options")
	$QuitButton/quit.connect("pressed", self, "_on_quit")


func _on_start():
	get_parent().get_parent().hide()
	get_node("2d").spawn_targets(30)
	get_node("2d/Node2d").show()

func _on_options():
	pass

func _on_quit():
	get_tree().quit()