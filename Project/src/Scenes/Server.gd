extends Node

var rooms = []
var room = {"key":"","pass":"","active":false, "score":0, "host_ip": "", "public": false}

var roomCheck = ["key", "pass", "active", "score", "host_ip", "public"]

func _ready():
	randomize()
	Globals.connect("request_random_room",self,"request_room")
	if Globals.is_server:
		var SERVER_PORT = Globals.SERVER_PORT
		var MAX_PLAYERS = Globals.MAX_PLAYERS
		var peer = NetworkedMultiplayerENet.new()
		peer.connect("peer_connected", self, "temp_store_of_peer")
		peer.create_server(SERVER_PORT, MAX_PLAYERS)
		get_tree().network_peer = peer
		$Control/CenterContainer/VBoxContainer/Status.text = "Running."

func temp_store_of_peer(id):
	print("Connected: " + id)

func send_data_to(id, data):
  rpc_id(id, "data_received", data)

remote func check_secret_key(key) -> bool:
	if key == Globals.secret_key:
		return true
	else:
		return false

remote func get_random_room():
	if rooms == []:
		return "AAAA"
	for Room in rooms:
		for stop in roomCheck:
			if not Room.has(stop):
				return "AAAA"
		if Room.public == true and Room.active == true:
			return Room.key
	pass

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
	if room_key == "AAAA":
		room_key = random_room(size)
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

remote func check_for_room(key):
	if rooms == []:
		return false
	for Room in rooms:
		if Room.has(key):
			if Room.key == key:
				return Room.host_ip
	return false


func _on_LineEdit_text_entered(new_text):
	if new_text != "":
#		var peers = get_tree().network_peer.set_target_peer(NetworkedMultiplayerENet.TARGET_PEER_BROADCAST)
		Notifications.rpc('notify', new_text)
		pass
	pass # Replace with function body.
