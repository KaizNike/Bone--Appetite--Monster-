extends Node

var version = [0,4,"-alpha"]
var versonInfo = "The Menu Update: Now we can get into the game!"

signal music_changed(value)

signal lobby_players_updated(array)

var max_players = 12
var playersReady = []
