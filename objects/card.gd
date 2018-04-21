extends Spatial
var tweennode
var is_flipped = false

func _ready():
	randomize()
	tweennode = $Tween
	$Area/MeshInstance/Sprite3D.modulate = Color(rand_range(-100,100),rand_range(-100,100),rand_range(-100,100))

func flip():
	$Area/MeshInstance/AnimationPlayer.play("flip")
func flip_back():
	$Area/MeshInstance/AnimationPlayer.play("flip back")
	

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if $Area/MeshInstance/AnimationPlayer.is_playing():
			pass
		else:
			if is_flipped:
				flip() #sounds wrong way but its not
			else:
				flip_back() #sounds wrong way but its not
			is_flipped = !is_flipped


func _on_Area_mouse_entered():
	$Area/MeshInstance.get_surface_material(0).set_shader_param("mouse_over", true)


func _on_Area_mouse_exited():
	$Area/MeshInstance.get_surface_material(0).set_shader_param("mouse_over", false)
