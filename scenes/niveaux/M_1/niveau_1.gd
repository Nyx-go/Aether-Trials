extends Node2D

var current_player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Donnee.monde_actuel=1
	Donnee.niveau_actuel=1
	current_player = $Spawner/Player_Base
	$Spawner.spawn()
