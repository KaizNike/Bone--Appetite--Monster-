extends Node

func _ready():
	$Control/PanelContainer/VBoxContainer/HSplitContainer/ReturnButton.grab_focus()


func _on_ReturnButton_pressed():
	get_tree().change_scene("res://src/Scenes/Main Menu.tscn")
