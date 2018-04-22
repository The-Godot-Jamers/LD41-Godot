extends Node2D

var characters=[]
var bodycolor='lightpink'
var allowed_colors=['gold','aqua','orangered','violet','wheat','black']
var availablechars=['female 1']

func _ready():
	charsetgen(15)


func makechar(currentchar):
	
	for x in get_children():
		x.frames.clear_all()
		x.frames.add_animation('walk')
		for y in range(8):
			var path="res://sprites/characters/"+currentchar.chartype+'/'+x.name+'/slice_0_'+str(y)+'.png'
			#print(path)
			var im=Image.new()
			im.load(path)
			var tex=ImageTexture.new()
			tex.create_from_image(im)
			
			x.frames.add_frame('walk',tex)
	print(characters)
	colorchar(currentchar)
	
func colorchar(character,ob=self):
	for x in ob.get_children():
		#randomize()
		x.modulate=character[x.name]
		if x.has_method('play'):
			x.play('walk')

func charsetgen(num):
	characters.clear()
	for x in num:
		var c
		while true:
			c=chargen()
			if !characters.has(c):
				break
		characters.append(c)
	return true

func chargen():
	var currentchar={}
	randomize()
	var chartype=availablechars[randi()%availablechars.size()]
	currentchar['chartype']=chartype
	for x in ['body','hair','cap','shirt','pant','shoes']:
		randomize()
		if x!='body':
			currentchar[x]=ColorN(allowed_colors[randi()%allowed_colors.size()])
		else:
			currentchar[x]=ColorN(bodycolor)
	return currentchar
	
func makecardspr(currentchar,card):
	for x in card.get_node('Area/MeshInstance/character').get_children():
		
		var path="res://sprites/characters/"+currentchar.chartype+'/'+x.name+'/slice_0_0'+'.png'
			#print(path)
		var im=Image.new()
		im.load(path)
		var tex=ImageTexture.new()
		tex.create_from_image(im)
		x.texture=tex
	print(characters)
	colorchar(currentchar,card.get_node('Area/MeshInstance/character'))
	
	