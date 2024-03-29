extends CharacterBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_transforming_to = null

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = $AnimationPlayer

func _physics_process(delta):
	if Donnee.menu_visible :
		velocity.y=0
		velocity.x=0
	
	if is_transforming_to != null:
		if anim.is_playing():
			return
		else:
			$"..".switch_player(is_transforming_to)
			is_transforming_to = null
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
		
	
	#Transformation
	
	elif Input.is_action_just_pressed("transform_fire"):
		anim.play("transfo_feu")
		is_transforming_to = "fire"
		
	elif Input.is_action_just_pressed("transform_water"):
		anim.play("transfo_eau")
		is_transforming_to = "water"
		
	elif Input.is_action_just_pressed("transform_air"):
		anim.play("transfo_air")
		is_transforming_to = "air"
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	else:
		var direction = Input.get_axis("move_left", "move_right")
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		elif direction == 1:
			$AnimatedSprite2D.flip_h = false
		if direction:
			velocity.x = direction * SPEED
			if velocity.y == 0:
				anim.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y == 0:
				anim.play("idle")
		
		
		if velocity.y > 0:
			anim.play("fall")
	
	
	move_and_slide()
