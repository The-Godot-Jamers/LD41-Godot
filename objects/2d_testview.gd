extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$Sprite2.position = Vector2(512,300)
	

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	$Sprite2.rotation = $Sprite2.rotation + 0.01
