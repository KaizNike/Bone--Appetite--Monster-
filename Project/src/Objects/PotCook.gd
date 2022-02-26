extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	$pot_and_bone/AnimationPlayer.play("still")
#	$pot_and_bone/AnimationPlayer.play("SphereAction")
#	$AnimationPlayer.play("food cooking")
	$PCInteractionArea.connect("change_target_status",self,"target_status_changed")
	$PCInteractionArea.connect("change_interact_status",self,"interacting_status_changed")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func target_status_changed(Bool):
	if Bool:
		$Indicator.visible = true
	else:
		$Indicator.visible = false

func interacting_status_changed(Bool):
	if Bool:
		$pot_and_bone/AnimationPlayer.play("SphereAction")
	else:
		$pot_and_bone/AnimationPlayer.play("still")
