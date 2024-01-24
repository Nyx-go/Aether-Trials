extends CharacterBody2D



const SPEED = 300.0
var animationInfiltration = false
const infiltrationlengh = 50	
var is_transforming_to = null

@onready var anim = $AnimationPlayer


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if Donnee.menu_visible :
		velocity.y=0
		velocity.x=0
	
	# Add the gravity.
	if not is_on_floor() && !Donnee.menu_visible:
		velocity.y += gravity * delta
		
	
	#Gestion infiltration
	if !animationInfiltration:
		if Input.is_action_just_pressed("ability")  && !Donnee.menu_visible:
			if is_on_wall():
				var direction = Input.get_axis("move_left", "move_right")
				move_local_x(direction*infiltrationlengh)
				if move_and_collide(Vector2(0,0)):
					move_local_x(direction*infiltrationlengh*-1)
				else:
					var animationInfiltration = true
	else:
		var animationInfiltration = false
	
	#var speed = dashspeed if dash.is_dashing() and dash.couldown_started() else SPEED
	var speed = 0 if animationInfiltration else SPEED
	
	
	if is_transforming_to != null:
		if anim.is_playing():
			return
		else:
			$"..".switch_player(is_transforming_to)
			is_transforming_to = null
	
	elif Input.is_action_just_pressed("transform_water"):
		anim.play("detransformation")
		is_transforming_to = "base"
	
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
