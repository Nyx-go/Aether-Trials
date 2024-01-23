extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://scenes/niveaux/M_1/niveau_1.tscn")


func _on_button_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menuOption.tscn")


func _on_button_quit_pressed():
	get_tree().quit()
