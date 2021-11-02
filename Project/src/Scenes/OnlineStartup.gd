extends Node

var players = 0
var playersReady = []
var firstGrab = true

onready var controllerNum = $Control/PanelContainer/HSplitContainer/VBoxContainer/HSplitContainer2/ControllersNum
onready var startButton = get_node("Control/PanelContainer/HSplitContainer/VBoxContainer/StartButton")

func _ready():
#	var MAX_PLAYERS = Globals.MAX_PLAYERS

	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(Globals.SERVER_IP, Globals.SERVER_PORT)
	get_tree().network_peer = peer
	print(get_tree().is_network_server())
	print(get_tree().get_network_peer())
	Globals.connect("lobby_players_updated", self,"_on_players_updated")
	Input.connect("joy_connection_changed",self,"_controllers_changed")
	controllerNum.text = str(Input.get_connected_joypads().size())

func _input(event):
	if event.is_action_pressed("ui_down") and players > 0 and firstGrab:
		firstGrab = false
		$Control/PanelContainer/HSplitContainer/VBoxContainer/HSplitContainer3/OptionButton.grab_focus()
	pass

func _on_players_updated(array):
	startButton.disabled = false
	players = 0
	playersReady = array
	for x in array:
		if x:
			players += 1
	$Control/PanelContainer/HSplitContainer/VBoxContainer/HSplitContainer2/PlayerNum.text = str(players)
	
func _controllers_changed(device, connected):
	controllerNum.text = str(Input.get_connected_joypads().size())


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://src/Scenes/Main Menu.tscn")
	pass # Replace with function body.


func _on_StartButton_pressed():
	Globals.playersReady = playersReady
	Globals.Seed = int($Control/PanelContainer/HSplitContainer/VBoxContainer/HSplitContainer4/SeedLineEdit.text)
	print(Globals.Seed)
	get_tree().change_scene("res://src/Scenes/Main.tscn")
	pass # Replace with function body.


func _on_OptionButton_item_selected(index):
	"""func _ready():
	add_item("5 Minutes")
	add_item("10 Minutes")
	add_item("15 Minutes")
	add_item("30 Minutes")
	add_item("1 Hour")"""
	
	if index == 0:
		Globals.gameLength = 60*5
	elif index == 1:
		Globals.gameLength = 60*10
	elif index == 2:
		Globals.gameLength = 60*15
	elif index == 3:
		Globals.gameLength = 60*30
	elif index == 4:
		Globals.gameLength = 60*60
	print(Globals.gameLength)


func _on_LineEdit_text_entered(new_text):
	pass # Replace with function body.


func _on_JoinRoomCode_text_entered(new_text):
	pass # Replace with function body.
