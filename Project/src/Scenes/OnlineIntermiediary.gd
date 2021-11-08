extends Node


func _ready():
#	Notifications.notify("YEST!")
	var peer = NetworkedMultiplayerENet.new()
	var error = peer.create_client(Globals.SERVER_IP, Globals.SERVER_PORT)
	if error != OK:
		print(error)
		$Timer.start()
		pass
	else:
		get_tree().network_peer = peer
	$Control/PanelContainer/VBoxContainer/ReturnButton.grab_focus()
	
	
func _connected():
	$ConnectionContainer.connecting = false

func _is_connecting():
	$ConnectionContainer.connecting = true


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://src/Scenes/Main Menu.tscn")


func _on_Timer_timeout():
	var peer = NetworkedMultiplayerENet.new()
	var error = peer.create_client(Globals.SERVER_IP, Globals.SERVER_PORT)
	get_tree().network_peer = peer
	pass # Replace with function body.
