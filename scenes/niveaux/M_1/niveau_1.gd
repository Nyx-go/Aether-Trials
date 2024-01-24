extends Node2D

@onready var pont = $pont
@onready var player = $Player_Terre
var pontcouldown = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	Donnee.monde_actuel=1
	Donnee.niveau_actuel=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_pressed("ability"):
			var position_y=player.position.y+60
			var position_x = player.position.x+120
			pont.start_pont(position_x,position_y)
			pont.couldown_pont(pontcouldown)
