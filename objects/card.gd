extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tweennode
var is_flipped = true
 
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	tweennode=$Tween

func flip():
	$Area/MeshInstance/AnimationPlayer.play("flip")
func flip_back():
	$Area/MeshInstance/AnimationPlayer.play("flip back")
	

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if is_flipped:
			flip_back()
		else:
			flip()
		is_flipped = !is_flipped


func _on_Area_mouse_entered():
	$Area/MeshInstance.get_surface_material(0).set_shader_param("mouse_over", true)


func _on_Area_mouse_exited():
	$Area/MeshInstance.get_surface_material(0).set_shader_param("mouse_over", false)
