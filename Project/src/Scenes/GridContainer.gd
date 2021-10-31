extends GridContainer

var playersReady = []
var players

export(PackedScene) var playerButtons

func _ready():
	players = Globals.max_players
	for x in range(players):
		playersReady.push_front(false)
	pass

func _input(event):
	if event.is_action_pressed("action_key") and not playersReady[0]:
		var instance = playerButtons.instance()
		instance.player = 1
		$MarginContainer/VSplitContainer.add_child(instance)
		playersReady[0] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer/VSplitContainer/p1Label.text = "Player one in!"
	if event.is_action_pressed("p2_action_key") and not playersReady[1]:
		var instance = playerButtons.instance()
		instance.player = 2
		$MarginContainer2/VSplitContainer.add_child(instance)
		playersReady[1] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer2/VSplitContainer/p2Label.text = "Player two in!"
	if event.is_action_pressed("p3_action_key") and not playersReady[2]:
		var instance = playerButtons.instance()
		instance.player = 3
		$MarginContainer3/VSplitContainer.add_child(instance)
		playersReady[2] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer3/VSplitContainer/p3Label.text = "Player three in!"
	if event.is_action_pressed("p4_action_key") and not playersReady[3]:
		var instance = playerButtons.instance()
		instance.player = 4
		$MarginContainer4/VSplitContainer.add_child(instance)
		playersReady[3] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer/VSplitContainer/p4Label.text = "Player four in!"
	if event.is_action_pressed("action_key") and not playersReady[0]:
		var instance = playerButtons.instance()
		instance.player = 1
		$MarginContainer/VSplitContainer.add_child(instance)
		playersReady[0] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer/VSplitContainer/p1Label.text = "Player one in!"
	if event.is_action_pressed("action_key") and not playersReady[0]:
		var instance = playerButtons.instance()
		instance.player = 1
		$MarginContainer/VSplitContainer.add_child(instance)
		playersReady[0] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer/VSplitContainer/p1Label.text = "Player one in!"
	if event.is_action_pressed("action_key") and not playersReady[0]:
		var instance = playerButtons.instance()
		instance.player = 1
		$MarginContainer/VSplitContainer.add_child(instance)
		playersReady[0] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer/VSplitContainer/p1Label.text = "Player one in!"
	if event.is_action_pressed("action_key") and not playersReady[0]:
		var instance = playerButtons.instance()
		instance.player = 1
		$MarginContainer/VSplitContainer.add_child(instance)
		playersReady[0] = true
		Globals.emit_signal("lobby_players_updated", playersReady)
		$MarginContainer/VSplitContainer/p1Label.text = "Player one in!"
