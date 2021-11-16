extends Node

func _ready():
	for i in range(OS.get_cmdline_args().size()):
		match OS.get_cmdline_args()[i]:
			"--server":
				Globals.is_server = true
				get_tree().change_scene("res://src/Scenes/Server.tscn")
	
	$Control/PanelContainer/VBoxContainer/VersionLabel.text = "V " + str(Globals.version[0]) + "." + str(Globals.version[1]) + str(Globals.version[2])
	$Control/PanelContainer/VBoxContainer/VersionLabel.hint_tooltip = Globals.versonInfo
	$Control/PanelContainer/VBoxContainer/LocalPlayButton.grab_focus()

func _physics_process(delta):
	Notifications.notify("Last day, let's finish this thing!")

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


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://src/Scenes/Credits.tscn")
	pass # Replace with function body.


func _on_OnlinePlayButton_pressed():
	get_tree().change_scene("res://src/Scenes/OnlineIntermiediary.tscn")
	pass # Replace with function body.
