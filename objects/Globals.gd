extends Node

var level=0 setget setlevel
var characterno=0

func setlevel(lvl):
	characterno=pow((2+lvl),2)
	CharacterGenerator.charsetgen(characterno)