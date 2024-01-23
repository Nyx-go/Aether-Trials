extends Node2D

@onready var timer = $Timer
@onready var couldown = $Couldown

func start_dash(dur):
	timer.wait_time = dur
	timer.start()
	
func couldown_dash(dur):
	couldown.wait_time = dur
	couldown.start()

func is_dashing():
	return !timer.is_stopped()

func couldown_started():
	return !couldown.is_stopped()
