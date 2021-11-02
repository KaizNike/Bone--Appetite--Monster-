extends Node

func _ready():
	$Control/PanelContainer/VBoxContainer/VersionLabel.text = "V " + str(Globals.version[0]) + "." + str(Globals.version[1]) + str(Globals.version[2])
	$Control/PanelContainer/VBoxContainer/VersionLabel.hint_tooltip = Globals.versonInfo
	$Control/PanelContainer/VBoxContainer/LocalPlayButton.grab_focus()

func _on_QuitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_LocalPlayButton_pressed():
	var error = get_tree().change_scene("res://src/Scenes/LocalStartup.tscn")
	print(error)
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	$Control/PanelContainer/VBoxContainer/LocalPlayButton.grab_focus()
	pass # Replace with function body.