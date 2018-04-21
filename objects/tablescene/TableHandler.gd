extends Node

var card_num=25
var card_scene
var cards_ins=[]
var delay=10 #delay before fliping cards
func _ready():
	card_scene=load("res://objects/card.tscn")
	#spawn_deck(card_num)


func spawn_deck(cards):
	var spawnpos=$CardLaybed/DeckPosition.global_transform
	for x in range(cards):
		var card_instance=card_scene.instance()
		$CardLaybed/CardHolder.add_child(card_instance)
		card_instance.flipping = true
		cards_ins.append(card_instance)
		card_instance.global_transform=spawnpos
		card_instance.translation.y+=x*0.1
		#card_instance.flip()
	position_cards(cards)
	

func position_cards(cards):
	var p=get_points_within_circle_rect(cards,$CardLaybed/Area/CollisionShape.shape.radius)
	var i=0
	for x in range(cards-1,-1,-1):
		i+=1
		var c=cards_ins[x]
		c.tweennode.interpolate_property( c, 'translation', c.translation, Vector3(p[x].x,0,p[x].y),0.5,Tween.TRANS_LINEAR,Tween.EASE_IN,i*0.3 )
		c.tweennode.start()
		#c.translation=Vector3(p[x].x,0,p[x].y)
		
	
	flipcards(true)
func flipcards(wait_flip=false):
	if wait_flip:
		wait()
	else:
		for x in cards_ins:
			x.flip()
	


func wait():
	var t = Timer.new()
	t.set_wait_time(delay)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	flipcards()
	return

func get_points_within_circle_rect( npoints, radius ):
    if npoints == 1:
        return [Vector2()]
    elif npoints == 2:
        return [Vector2( -radius, 0 ), Vector2( radius, 0 ) ]
    elif npoints == 3:
        return [Vector2( 0, radius ), Vector2( 0, radius ).rotated( 2 * PI / 3 ), \
                Vector2( 0, radius ).rotated( -2 * PI / 3 ) ]
    # compute sides of square
    var max_recside = 9
    var recside = 0
    for n in range( max_recside ):
        if ( n * n ) >= npoints:
            recside = n
            break
    
    # actual size of the rectangle
    var recside_px = 2 * radius / sqrt( 2 )
    
    # distance between adjacent points
    var point_dist = recside_px / ( recside - 1 )
    
    # create points
    var points = []
    var done = false
    for py in range( recside ):
        for px in range( recside ):
            var p = Vector2( px * point_dist, py * point_dist ) - \
                    Vector2( recside_px, recside_px ) / 2
            points.append( p )
            if points.size() == npoints:
                done = true
                break
        if done:
            break
    return points