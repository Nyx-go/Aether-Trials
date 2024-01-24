extends CharacterBody2D

var nbPont = 10
@onready var couldown = $Couldown
@onready var hitBox = $CollisionShape2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	
	move_and_slide()
	
func start_pont(position_pont_x,position_pont_y):
	afficher_pont(position_pont_x,position_pont_y)
	couldown_pont(3)
	
func couldown_pont(dur):
	couldown.wait_time = dur
	couldown.start()


func couldown_started():
	return !couldown.is_stopped()
	
func afficher_pont(position_pont_x, position_pont_y) : 
	position.x = position_pont_x
	position.y = position_pont_y
	visible = true

	
	
	
	
