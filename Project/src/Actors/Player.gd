extends KinematicBody

export var player = 1
export var local = true

export var speed = 250
export var gravity = 50
var vel = Vector3.ZERO
var areas_in_range = []
var holding_something = false
var held_object
var is_grabbing = false
var throw = false
# Currently supported: "cook"
var current_action = ""
# A note, interactType exists as interact_type in the areas, strange i know
var a_area = {"priority": 0, "area": Area, "interactType": "", "targetedLast": false}

class A_Area_Sorter:
	static func sort_ascending(a:Dictionary, b:Dictionary):
		if a.priority < b.priority:
			return true
		return false

# Called when the node enters the scene tree for the first time.
func _ready():
	$PCInteractionArea.connect("change_target_status",self,"target_status_changed")
	pass # Replace with function body.
	
func _input(event):
	if (event.is_action_pressed("action_key") and player == 1 or
	event.is_action_pressed("p2_action_key") and player == 2 or
	event.is_action_pressed("p3_action_key") and player == 3 or
	event.is_action_pressed("p4_action_key") and player == 4):
		interact()
	pass

func _physics_process(delta):
	vel = _get_dir()
	vel *= speed * delta
	animates_player(vel)
	vel.y -= gravity * delta
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

func animates_player(vel):
	if holding_something:
		if throw:
			throw_foward()
		return
	elif current_action == "cook":
		$AnimatedSprite3D.animation = "cook"
		$AnimatedSprite3D.playing = true
		return
	elif is_grabbing:
		$AnimatedSprite3D.animation = "grab"
		holding_something = true
		return
	elif vel.x != 0 or vel.z != 0:
		$AnimatedSprite3D.animation = "walk"
		$AnimatedSprite3D.playing = true
	else:
		$AnimatedSprite3D.animation = "default"
		$AnimatedSprite3D.playing = false

func target_status_changed(Bool):
	if Bool:
		$Indicator.visible = true
	else:
		$Indicator.visible = false

func throw_foward():
	$AnimatedSprite3D.animation = "letgo"
	holding_something = false
	pass

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

func remove_area_from_array(area, array:Array):
	var index = find_index_of_area_in_array(area,array)
	array.remove(index)
	if area.targetted:
		area.targetted = false
	if area.is_interacting:
		area.is_interacting = false
		current_action = ""

func interact():
	var interact_type = ""
	if areas_in_range.size() > 0:
		if areas_in_range[0].area.targetted == true:
			areas_in_range[0].area.is_interacting = true
			interact_type = areas_in_range[0].area.interact_type
	if interact_type == "":
		return
	else:
		if interact_type == "pot":
#			$AnimatedSprite3D.animation = "cook"
#			$AnimatedSprite3D.playing = true
			current_action = "cook"

func _on_PCInteractionArea_area_entered(area):
	if area.is_in_group("interact"):
		if "interact_priority" in area and "targetted" in area and "interact_type" in area:
			if not find_if_area_in_array(area, areas_in_range):
				var new_area = a_area
				new_area.area = area
				new_area.interactType = area.interact_type
				new_area.priority = area.priority
				areas_in_range.push_front(a_area)
				sort_areas()
				find_target(areas_in_range)
		pass
	pass # Replace with function body.


func _on_AnimatedSprite3D_animation_finished():
	if $AnimatedSprite3D.animation == "grab":
		$AnimatedSprite3D.playing = false
	pass # Replace with function body.


func _on_PCInteractionArea_area_exited(area):
	if area.is_in_group("interact"):
		if "interact_priority" in area and "targetted" in area:
			if find_if_area_in_array(area, areas_in_range):
				remove_area_from_array(area, areas_in_range)
				pass
	pass # Replace with function body.
