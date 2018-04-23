extends Control


func _on_AnimationPlayer_animation_finished(anim_name):
	loader.loadscn("main1")
