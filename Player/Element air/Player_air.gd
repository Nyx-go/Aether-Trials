extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#Conteur de saut et son max
var jump_count = 0
var max_jum = 2

const dashspeed = 800
const dashlengh = 0.1
const dashcouldown = 3

@onready var dash = $Dash


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	#Gestion du dash
	if !dash.couldown_started():
		if Input.is_action_just_pressed("ability"):
			dash.start_dash(dashlengh)
			dash.couldown_dash(dashcouldown)
	
	var speed = dashspeed if dash.is_dashing() and dash.couldown_started() else SPEED

	if is_on_floor():
		jump_count = 0;
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jum:
		velocity.y = JUMP_VELOCITY
		jump_count+=1
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
	else: 
		velocity.x = 0
	

	move_and_slide()
