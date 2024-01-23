extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Donnee.monde_actuel=1
	Donnee.niveau_actuel=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#NiveauGeneral.get_input()
	#NiveauGeneral.position_actuel= get_node("CharacterBody2D").position
	#print(NiveauGeneral.position_actuel)
	pass
