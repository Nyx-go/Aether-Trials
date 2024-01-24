extends Area2D

var speed = 500

func _physics_process(delta):
	position += transform.x * speed * delta
	
func _ready() -> void:
	#connect("body_entered", self, "_on_Area_body_entered")
	pass

func _on_Area_body_entered(body:Node) -> void:
	print("OUUUUIIIIIIIIIIIIIIIIIIIIII")
	queue_free()


func _on_body_entered(body):
	print("OUUUUIIIIIIIIIIIIIIIIIIIIII")
	queue_free()
