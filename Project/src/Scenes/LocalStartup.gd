extends Node

var players = 0
var playersReady = []
var firstGrab = true

func _ready():
	Globals.connect("lobby_players_updated", self,"_on_players_updated")
	Input.connect("joy_connection_changed",self,"_controllers_changed")
	$Control/PanelContainer/VBoxContainer/HSplitContainer2/ControllersNum.text = str(Input.get_connected_joypads().size())

func _input(event):
	if event.is_action_pressed("ui_down") and players > 0 and firstGrab:
		firstGrab = false
		$Control/PanelContainer/VBoxContainer/HSplitContainer3/OptionButton.grab_focus()
	pass

func _on_players_updated(array):
	$Control/PanelContainer/VBoxContainer/StartButton.disabled = false
	players = 0
	playersReady = array
	for x in array:
		if x:
			players += 1
	$Control/PanelContainer/VBoxContainer/HSplitContainer2/PlayerNum.text = str(players)
	
func _controllers_changed(device, connected):
	$Control/PanelContainer/VBoxContainer/HSplitContainer2/ControllersNum.text = str(Input.get_connected_joypads().size())


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://src/Scenes/Main Menu.tscn")
	pass # Replace with function body.


func _on_StartButton_pressed():
	Globals.playersReady = playersReady
	get_tree().change_scene("res://src/Scenes/Main.tscn")
	pass # Replace with function body.
