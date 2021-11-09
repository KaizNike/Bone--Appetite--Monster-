extends Node


func _ready():
	get_tree().connect("connection_failed", self, "_connected_fail")
#	Notifications.notify("YEST!")
	var peer = NetworkedMultiplayerENet.new()
	var error = peer.create_client(Globals.SERVER_IP, Globals.SERVER_PORT)
	check_server(error, peer)
	$Control/PanelContainer/VBoxContainer/ReturnButton.grab_focus()
	
func check_server(error, peer):
	if error != OK:
		print(error)
		$Timer.start()
		pass
	else:
		get_tree().network_peer = peer
		var check = Server.rpc("check_secret_key", Globals.secret_key)
		if not check:
			_connected_fail()
	pass
	
func _connected_fail():
	$Control/PanelContainer/VBoxContainer/HostButton.disabled = true
	$Control/PanelContainer/VBoxContainer/JoinButton.disabled = true
	$Control/PanelContainer/VBoxContainer/LineEdit.editable = false
	Notifications.notify("No connection to server!")
	get_tree().network_peer = null
	_is_connecting()
	$Timer.start()

func _connected():
	$ConnectionContainer.connecting = false
	$Control/PanelContainer/VBoxContainer/HostButton.disabled = false
	$Control/PanelContainer/VBoxContainer/JoinButton.disabled = false
	$Control/PanelContainer/VBoxContainer/LineEdit.editable = true

func _is_connecting():
	$ConnectionContainer.connecting = true


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://src/Scenes/Main Menu.tscn")


func _on_Timer_timeout():
	var peer = NetworkedMultiplayerENet.new()
	var error = peer.create_client(Globals.SERVER_IP, Globals.SERVER_PORT)
	get_tree().network_peer = peer
	check_server(error, peer)
	pass # Replace with function body.


func _on_LineEdit_text_entered(new_text):
	if new_text == "":
		var store = Server.rpc("get_random_room")
		if store == "AAAA":
			$Control/PanelContainer/VBoxContainer/LineEdit.text = "AAAA"
			Notifications.notify("No servers found, try hosting one yourself publicly.")
			return
	else:
		var ipCheck = Server.rpc("check_for_room", new_text)
		if ipCheck == false:
			Notifications.notify("That server wasn't found or not public.")
			return
	pass # Replace with function body.


func _on_HostButton_pressed():
	pass # Replace with function body.
