extends Node

var rooms = []
var room = {"key":"","active":false, "score":0}


func _ready():
	var SERVER_PORT = Globals.SERVER_PORT
	var MAX_PLAYERS = Globals.MAX_PLAYERS
	if Globals.is_server:
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(SERVER_PORT, MAX_PLAYERS)
		get_tree().network_peer = peer
		$Control/CenterContainer/VBoxContainer/Status.text = "Running."

remote func request_room() -> String:
	var n_chars = len(Globals.capital_characters)
	
	return "none"

remote func get_rooms_length() -> int:
	return rooms.size()

remote func add_room(key) -> bool:
	if rooms.has(key):
		return false
	else:
		var Room = room.duplicate(true)
		Room.key = key
		Room.active = true
		rooms.push_front(Room)
		return true

remote func remove_room(key) -> bool:
	var index = 0
	for Room in rooms:
		if Room.key == key:
			rooms.remove(index)
			return true
		index += 1
	return false

remote func check_for_room(key) -> bool:
	if rooms.has(key):
		return true
	else:
		return false
