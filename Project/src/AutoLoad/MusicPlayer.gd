extends Node

func _ready():
	$MainMenu.play()

func stop_playing():
	for child in get_children():
		if child is AudioStreamPlayer:
			if child.playing == true:
				child.stop()
		
