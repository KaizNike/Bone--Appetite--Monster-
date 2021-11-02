extends Node

var version = [0,6,"-alpha"]
var versonInfo = "Timer and music!"
var gameLength = 60 * 5

signal music_changed(value)
signal time_ran_out()

signal lobby_players_updated(array)

var max_players = 12
var playersReady = []
