extends Node
#Version - Update with changes
var version = [0,8,"-alpha"]
var versonInfo = "Multiplayer basics!"
##
var gameLength = 60 * 5
var Seed = 0



var max_players = 12
var playersReady = []

#Multiplayer vars
var is_server = false
const SERVER_IP = "127.0.0.1"
const SERVER_PORT = 3332
const MAX_PLAYERS = 1000
var online_room_key = ""
var secret_key = "Aba"


var characters = 'abcdefghijklmnopqrstuvwxyz'
var capital_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var room_key_size = 4
##


#Signals
signal music_changed(value)
signal time_ran_out()

signal lobby_players_updated(array)
##

#Multiplayer Signals
signal chat_recieved(text)
signal request_random_room()
signal match_secret_key(secret_key)
##

func _ready():
	randomize()

func generate_room_key() -> String:
	var Key = ""
	
	return ""
	pass
