extends Node

var players = 0

func _ready():
	Globals.connect("lobby_players_updated", self,"_on_players_updated")

func _on_players_updated(array):
	$Control/PanelContainer/VBoxContainer/Button.disabled = false
	players = 0
	for x in array:
		if x:
			players += 1
	$Control/PanelContainer/VBoxContainer/HSplitContainer2/PlayerNum.text = str(players)
