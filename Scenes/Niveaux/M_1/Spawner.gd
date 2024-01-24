extends Node2D

var current_player = null
var players = {}

# Called when the node enters the scene tree for the first time.
func spawn():
	players["base"] = $Player_Base
	players["fire"] = $Player_fire
	players["air"] = $Player_air
	players["water"] = $Player_water
	
	current_player = $Player_Base
	
	self.remove_child($Player_fire)
	self.remove_child($Player_air)
	self.remove_child($Player_water)

func switch_player(player_name):
	var new_player = players[player_name]
	new_player.position.x = current_player.position.x
	new_player.position.y = current_player.position.y
	self.remove_child(current_player)
	self.add_child(new_player)
	current_player = new_player


