extends Control

func _ready():
	$Timer.wait_time = Globals.gameLength
	$Timer.start()

func _physics_process(delta):
	$PanelContainer/HSplitContainer/TimeLeft.text = str($Timer.time_left)

func _on_Timer_timeout():
	Globals.emit_signal("time_ran_out")
