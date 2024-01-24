extends CharacterBody2D


@export var SPEED = 300.0
# @export var Fireball : PackedScene
const JUMP_VELOCITY = -400.0
const fireball_path = preload("res://Player/element_Feu/Fireball.tscn")


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Donnee.menu_visible :
		velocity.y=0
		velocity.x=0
	# Add the gravity.
	if  !is_on_floor() && !Donnee.menu_visible:
		velocity.y += gravity * delta
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump") && is_on_floor() && !Donnee.menu_visible:
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ability"):
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction && !Donnee.menu_visible:
		velocity.x = direction * SPEED
		
	else:
		if !direction && !Donnee.menu_visible :
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func shoot():
	var f = fireball_path.instantiate()
	get_parent().add_child(f)
	f.position = $Marker2D.global_position
