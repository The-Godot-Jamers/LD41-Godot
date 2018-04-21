extends Camera

export var Rotation_Speed=0.2
var looking_at_table = true

func _ready():

	look_at(get_parent().global_transform.origin,Vector3(0,1,0))

func _process(delta):
	if Input.is_action_pressed("cam_rotate_left"):
		#get_parent().rotate_y(-Rotation_Speed*delta)
		$Tween.interpolate_method(get_parent(),'rotate_y',-Rotation_Speed*delta,0,0.7,Tween.TRANS_LINEAR,Tween.EASE_OUT,0)
	if Input.is_action_pressed("cam_rotate_right"):
		#get_parent().rotate_y(Rotation_Speed*delta)
		$Tween.interpolate_method(get_parent(),'rotate_y',Rotation_Speed*delta,0,1,Tween.TRANS_LINEAR,Tween.EASE_OUT,0)
	if Input.is_action_pressed("cam_zoom_in"):
		#translation=translation*0.95
		$Tween.interpolate_property(self,'translation',translation,translation*0.9,0.7,Tween.TRANS_EXPO,Tween.EASE_OUT,0)
	if Input.is_action_pressed("cam_zoom_out"):
		#translation=translation*1.05
		$Tween.interpolate_property(self,'translation',translation,translation*1.1,0.7,Tween.TRANS_EXPO,Tween.EASE_OUT,0)
	
	if Input.is_action_just_pressed("2"):
		$AnimationPlayer.play("camera turn")
	if Input.is_action_just_pressed("3"):
		$AnimationPlayer.play("camera turn back")
	$Tween.start()