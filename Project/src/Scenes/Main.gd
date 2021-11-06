extends Spatial

export(PackedScene) var PlayerScene

func _ready():
	if Globals.playersReady.size() == 0:
		print("That was weird!")
		get_tree().change_scene("res://src/Scenes/Main Menu.tscn")
	var index = 1
	for player in Globals.playersReady:
		if player:
			var instance = PlayerScene.instance()
			instance.player = index
			if index == 1:
				instance.translation = $Positions/Position1.translation
			if index == 2:
				instance.translation = $Positions/Position2.translation
			if index == 3:
				instance.translation = $Positions/Position3.translation
			if index == 4:
				instance.translation = $Positions/Position4.translation
			$Players.add_child(instance)
		
		index += 1
		pass
