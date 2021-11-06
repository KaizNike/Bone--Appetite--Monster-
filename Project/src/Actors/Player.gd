extends KinematicBody

export var player = 1
export var local = true

export var speed = 250
var vel = Vector3.ZERO
var areas_in_range = []
var a_area = {"priority": 0, "area": Area, "targetedLast": false}

class A_Area_Sorter:
	static func sort_ascending(a:Dictionary, b:Dictionary):
		if a.priority < b.priority:
			return true
		return false

# Called when the node enters the scene tree for the first time.
func _ready():
	$PCInteractionArea.connect("change_target_status",self,"target_status_changed")
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

func target_status_changed(Bool):
	if Bool:
		$Indicator.visible = true
	else:
		$Indicator.visible = false

func sort_areas():
	if areas_in_range.size() > 1:
		areas_in_range.sort_custom(A_Area_Sorter, "sort_ascending")

# Array should contain a_area dictionaries
func find_target(array):
	if array.size() > 1:
		pass
	else:
		array[0].area.targetted = true
	pass

func find_if_area_in_array(area, array):
	for dict in array:
		if dict.area == area:
			return true
	return false
	
func find_index_of_area_in_array(area, array):
	var index = 0
	for dict in array:
		if dict.area == area:
			return index
		index += 1
	return false

func _on_PCInteractionArea_area_entered(area):
	if area.is_in_group("interact"):
		if "interact_priority" in area and "targetted" in area:
			if not find_if_area_in_array(area, areas_in_range):
				var new_area = a_area
				new_area.area = area
				new_area.priority = area.priority
				areas_in_range.push_front(a_area)
				sort_areas()
				find_target(areas_in_range)
		pass
	pass # Replace with function body.
