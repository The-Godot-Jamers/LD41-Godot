extends VBoxContainer

func _ready():
	Globals.level+=1
	$Tween.interpolate_property(self, "modulate", Color(1.0,1.0,1.0,1.0), Color(1.0,1.0,1.0,0.0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	$shuffle_sound.play()
	modulate = Color(1.0,1.0,1.0,1.0)
	get_parent().get_parent().hide()
	get_node("../../../../../3d").spawn_deck(25)