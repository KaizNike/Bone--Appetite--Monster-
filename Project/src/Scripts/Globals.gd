extends Node

var version = [0,6,"-alpha"]
var versonInfo = "Timer and music!"
var gameLength = 60 * 5
var Seed = 0
var is_server = false


const SERVER_IP = "127.0.0.1"
const SERVER_PORT = 3332
const MAX_PLAYERS = 1000

signal music_changed(value)
signal time_ran_out()
signal chat_recieved(text)

signal lobby_players_updated(array)

var max_players = 12
var playersReady = []
