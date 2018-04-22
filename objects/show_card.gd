extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	print(get_node("../../../CardLaybed/CardHolder/card"))
	get_node("../../../CardLaybed/CardHolder/card").connect("show", self, "show",card)

func show():
	if !$AnimationPlayer.is_playing():
		$AnimationPlayer.play("show card")
