extends Spatial
var tweennode
var is_flipped = false
var flipping = false
var flippable 
var show_card 
var characterid

signal hide
signal show

func _ready():
	randomize()
	tweennode = $Tween
	$Area/MeshInstance/card_bottom.modulate = Color(rand_range(0,0.5),rand_range(0,0.5),rand_range(0,0.5))

func flip():
	if flippable:
		flipping = true
		$Area/MeshInstance/AnimationPlayer.play("flip")
func flip_back():
	if flippable:
		flipping = true
		$Area/MeshInstance/AnimationPlayer.play("flip back")
	

func show(charid):
	print("show")
	CharacterGenerator.makecardspr(CharacterGenerator.characters[charid],self)
	$Tween.interpolate_property(self,"translation",Vector3(0.0,-0.3,-0.25),Vector3(0.0,-0.1,-0.25),1.0,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
func hide():
	print("hide")
	$Tween.interpolate_property(self,"translation",Vector3(0.0,-0.1,-0.25),Vector3(0.0,-0.3,-0.25),1.0,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if $Area/MeshInstance/AnimationPlayer.is_playing() or flipping:
			pass
		else:
			if is_flipped:
				#$draw1.play()
				emit_signal("hide")
				flip() #sounds wrong way but its not
			else:
				#$draw2.play()
				emit_signal("show")
				flip_back() #sounds wrong way but its not
			is_flipped = !is_flipped
	

func _on_Area_mouse_entered():
	$Area/MeshInstance.get_surface_material(0).set_shader_param("mouse_over", true)

func _on_Area_mouse_exited():
	$Area/MeshInstance.get_surface_material(0).set_shader_param("mouse_over", false)

func _on_AnimationPlayer_animation_finished(anim_name):
	flipping = false
