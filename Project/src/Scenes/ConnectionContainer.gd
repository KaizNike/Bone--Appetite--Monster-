extends PanelContainer

var connecting = false
var speed = 10

func _physics_process(delta):
	if connecting:
		if $HSplitContainer/ConnectionTryingBar.value == 100:
			$HSplitContainer/ConnectionTryingBar.value = 0
		$HSplitContainer/ConnectionTryingBar.value += delta * speed
	else:
		$HSplitContainer/ConnectionTryingBar.value = 100
		$HSplitContainer/Label.text = "Connected!"
