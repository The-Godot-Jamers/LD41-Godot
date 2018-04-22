extends Node2D

var characters=[]
var bodycolor='lightpink'
var allowed_colors=['gold','aqua','orangered','violet','wheat','black']

func _ready():
	makecharacter()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		makecharacter()
func makecharacter():
	for x in get_children():
		randomize()
		x.modulate=ColorN(allowed_colors[randi()%allowed_colors.size()])
		x.play('default')
	$body.modulate=ColorN(bodycolor)