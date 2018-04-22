extends Spatial

func _ready():
	var viewport = get_node("Viewport")
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	get_node("MeshInstance/MeshInstance").material_override.albedo_texture = viewport.get_texture()