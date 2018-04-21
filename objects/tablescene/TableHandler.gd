extends Node

var card_num=15
var card_scene
var cards_ins=[]

func _ready():
	card_scene=load("res://objects/card.tscn")
	spawn_deck(card_num)


func spawn_deck(cards):
	var spawnpos=$CardLaybed/DeckPosition.global_transform
	for x in range(cards):
		var card_instance=card_scene.instance()
		$CardLaybed/CardHolder.add_child(card_instance)
		cards_ins.append(card_instance)
		card_instance.global_transform=spawnpos
		card_instance.translation.y+=x*0.1
		card_instance.flip()