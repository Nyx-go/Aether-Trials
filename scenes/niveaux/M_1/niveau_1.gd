extends Node2D

@onready var Pont = $pont

# Called when the node enters the scene tree for the first time.
func _ready():
	Donnee.monde_actuel=1
	Donnee.niveau_actuel=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var position_y=Donnee.y_pont+60
	var position_x=Donnee.x_pont+120
	Pont.start_pont(position_x,position_y)
