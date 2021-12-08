extends RichTextLabel

func _ready():
	Globals.connect("chat_recieved", self, "_update_log")
	pass
	
func _update_log(text):
	text += "/n" + str(text)
