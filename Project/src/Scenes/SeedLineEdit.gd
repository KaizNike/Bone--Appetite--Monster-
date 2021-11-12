extends LineEdit

func _ready():
	randomize()
	text = str(randi())

func _unhandled_input(event):
	if has_focus() and event.is_action_pressed("action_key"):
		text = str(randi())
