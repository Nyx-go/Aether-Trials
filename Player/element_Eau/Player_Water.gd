extends CharacterBody2D



const SPEED = 300.0

var animationInfiltration = false

const infiltrationlengh = 50	


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
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_right") && !Donnee.menu_visible :
		velocity.x = speed
	elif Input.is_action_pressed("move_left") && !Donnee.menu_visible :
		velocity.x = -speed
	else: 
		velocity.x = 0
	

	move_and_slide()
