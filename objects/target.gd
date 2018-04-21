extends Node2D

var id = 0

func _ready():
	# connet to right signal
	$AnimationPlayer.play("walk")
	pass

func _on_card_shoot(index, hit):
	if index != id:
		return
	
	if hit:
		$AnimationPlayer.play("death")
	else:
		$AnimationPlayer.play("miss")
