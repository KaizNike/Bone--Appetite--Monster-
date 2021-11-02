extends LineEdit

func _ready():
	randomize()
	text = str(randi())
