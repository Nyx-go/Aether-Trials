extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()


func _on_reprendre_pressed():
	Donnee.menu_visible=false
	get_parent().visible=false


func _on_recommencer_pressed():
	var path_file="res://scenes/niveaux/M_"
	path_file += str(Donnee.monde_actuel)+"/niveau_"+str(Donnee.niveau_actuel)+".tscn"
	Donnee.menu_visible=false
	get_tree().change_scene_to_file(path_file)

func _on_menu_pressed():
	Donnee.menu_visible=false
	get_tree().change_scene_to_file("res://scenes/menu/menuDebut.tscn")


func _on_quitter_pressed():
	get_tree().quit()

func resum() :
	get_parent().visible=false
	get_tree().set_deferred("paused", false)
	 
func pause() :
	get_parent().visible=true
	get_tree().set_deferred("paused", true)
	
func get_input() : 
	if Input.is_action_just_pressed("echap") :
		if Donnee.menu_visible : 
			get_parent().visible=false
			Donnee.menu_visible=false
		else : 
			get_parent().visible=true
			Donnee.menu_visible=true
