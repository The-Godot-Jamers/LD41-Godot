extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func flip():
	$MeshInstance/AnimationPlayer.play("flip")
func flip_back():
	$MeshInstance/AnimationPlayer.play("flip back")
	