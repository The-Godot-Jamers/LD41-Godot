extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tweennode

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	tweennode=$Tween

func flip():
	$MeshInstance/AnimationPlayer.play("flip")
func flip_back():
	$MeshInstance/AnimationPlayer.play("flip back")
	

func mouse_over():
	$MeshInstance.get_material().set_shader_param("mouse_over", true)
func mouse_out():
	$MeshInstance.get_material().set_shader_param("mouse_over", false)