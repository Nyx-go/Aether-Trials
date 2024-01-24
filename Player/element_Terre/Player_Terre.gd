extends CharacterBody2D




const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const fireball_path = preload("res://Player/element_Feu/Fireball.tscn")


const pontcouldown = 3
#@onready var pont = $Pont

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Donnee.menu_visible :
		velocity.y=0
		velocity.x=0
	# Add the gravity.
	if  !is_on_floor():
		velocity.y += gravity * delta
	
func _process(delta):
	if Input.is_action_just_pressed("ability"):
		Donnee.y_pont=position.y
		Donnee.x_pont=position.x
	
	if  !is_on_floor() && !Donnee.menu_visible:
		velocity.y += gravity * delta
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump") && is_on_floor() && !Donnee.menu_visible:
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ability") && !Donnee.menu_visible:
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	else: 
		velocity.x = 0

	move_and_slide()


func shoot():
	var f = fireball_path.instantiate()
	get_parent().add_child(f)
	f.position = $Marker2D.global_position
