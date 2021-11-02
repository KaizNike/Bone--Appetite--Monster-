extends Node

var rooms = []

func _ready():
	var SERVER_PORT = Globals.SERVER_PORT
	var MAX_PLAYERS = Globals.MAX_PLAYERS
	if Globals.is_server:
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(SERVER_PORT, MAX_PLAYERS)
		get_tree().network_peer = peer
		$Control/CenterContainer/VBoxContainer/Status.text = "Running."

remote func add_room(key) -> bool:
	if rooms.has(key):
		return false
	else:
		rooms.push_front(key)
		return true

remote func remove_room(key) -> bool:
	if rooms.has(key):
		var find = rooms.find(key)
		rooms.remove(find)
		return true
	else:
		return false

remote func check_for_room(key) -> bool:
	if rooms.has(key):
		return true
	else:
		return false
