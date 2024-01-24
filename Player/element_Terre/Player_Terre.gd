extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const pontcouldown = 3
#@onready var pont = $Pont

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if  !is_on_floor():
		velocity.y += gravity * delta
		
	#if !pont.couldown_started():
		#if Input.is_action_just_pressed("ability"):
			#pont.start_pont()
			#pont.couldown_pont(pontcouldown)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	else: 
		velocity.x = 0

	move_and_slide()
