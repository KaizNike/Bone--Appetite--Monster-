extends Node

var rooms = []
var room = {"key":"","active":false, "score":0, "host_ip": ""}


func _ready():
	randomize()
	Globals.connect("request_random_room",self,"request_room")
	if Globals.is_server:
		var SERVER_PORT = Globals.SERVER_PORT
		var MAX_PLAYERS = Globals.MAX_PLAYERS
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(SERVER_PORT, MAX_PLAYERS)
		get_tree().network_peer = peer
		$Control/CenterContainer/VBoxContainer/Status.text = "Running."

remote func check_secret_key(key) -> bool:
	if key == Globals.secret_key:
		return true
	else:
		return false

remote func request_room() -> String:
	var RoomKey = random_room(Globals.room_key_size)
	while(check_for_room(RoomKey)):
		RoomKey = random_room(Globals.room_key_size)
	return RoomKey
	
func random_room(size) -> String:
	var capital_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var n_chars = len(capital_characters)
	var room_key = ''
	for i in range(size):
		room_key += capital_characters[randi()%n_chars]
	return room_key

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
	for Room in rooms:
		if Room.has(key):
			return true
	return false
