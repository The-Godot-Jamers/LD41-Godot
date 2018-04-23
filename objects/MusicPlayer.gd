extends AudioStreamPlayer

func _ready():
	play()

func _on_music_finished():
	#print("change song")
	stream = "res://music/WIP_Track.ogg"
	play()