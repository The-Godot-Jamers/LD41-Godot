extends Camera

export var Rotation_Speed=5

func _ready():

	look_at(get_parent().global_transform.origin,Vector3(0,1,0))

func _process(delta):
	if Input.is_action_pressed("cam_rotate_left"):
		get_parent().rotate_y(-Rotation_Speed*delta)
	if Input.is_action_pressed("cam_rotate_right"):
		get_parent().rotate_y(Rotation_Speed*delta)
		
	if Input.is_action_pressed("cam_zoom_in"):
		translation=translation*0.95
	if Input.is_action_pressed("cam_zoom_out"):
		translation=translation*1.05