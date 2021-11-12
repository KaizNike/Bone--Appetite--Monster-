extends KinematicBody

export var player = 1
export var local = true

export var speed = 250
var vel = Vector3.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	vel = _get_dir()
	vel *= speed * delta
	move_and_slide(vel,Vector3.UP)
	pass
	
	
func _get_dir() -> Vector3:
	if player == 1:
		return Vector3(
			-Input.get_action_strength("move_left") + Input.get_action_strength("move_right"), 
			0, 
			-Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
		)
	if player == 2:
		return Vector3(
			-Input.get_action_strength("p2_move_left") + Input.get_action_strength("p2_move_right"), 
			0, 
			-Input.get_action_strength("p2_move_up") + Input.get_action_strength("p2_move_down")
		)
	if player == 3:
		return Vector3(
			-Input.get_action_strength("p3_move_left") + Input.get_action_strength("p3_move_right"), 
			0, 
			-Input.get_action_strength("p3_move_up") + Input.get_action_strength("p3_move_down")
		)
	if player == 4:
		return Vector3(
			-Input.get_action_strength("p4_move_left") + Input.get_action_strength("p4_move_right"), 
			0, 
			-Input.get_action_strength("p4_move_up") + Input.get_action_strength("p4_move_down")
		)
	return Vector3.ZERO
