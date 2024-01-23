extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reprendre_pressed():
	pass # Replace with function body.


func _on_recommencer_pressed():
	pass # Replace with function body.


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menuDebut.tscn")


func _on_quitter_pressed():
	pass # Replace with function body.
