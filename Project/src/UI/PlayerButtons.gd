extends HBoxContainer

var player = 1

func _input(event):
	if event.is_action_pressed("action_key") and player == 1:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p2_action_key") and player == 2:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p3_action_key") and player == 3:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p4_action_key") and player == 4:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p5_action_key") and player == 5:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p6_action_key") and player == 6:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p7_action_key") and player == 7:
		$CheckBox.pressed = true
	elif event.is_action_pressed("p8_action_key") and player == 8:
		$CheckBox.pressed = true
	else:
		if event.is_action_released("action_key") and player == 1:
			$CheckBox.pressed = false
		elif event.is_action_released("p2_action_key") and player == 2:
			$CheckBox.pressed = false
		elif event.is_action_released("p3_action_key") and player == 3:
			$CheckBox.pressed = false
		elif event.is_action_released("p4_action_key") and player == 4:
			$CheckBox.pressed = false
		elif event.is_action_released("p5_action_key") and player == 5:
			$CheckBox.pressed = false
		elif event.is_action_released("p6_action_key") and player == 6:
			$CheckBox.pressed = false
		elif event.is_action_released("p7_action_key") and player == 7:
			$CheckBox.pressed = false
		elif event.is_action_released("p8_action_key") and player == 8:
			$CheckBox.pressed = false
	if event.get_action_strength("move_up") != 0 or event.get_action_strength("move_down") != 0:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("move_up") - event.get_action_strength("move_down")) * 50
	elif event.get_action_strength("move_left") != 0 or event.get_action_strength("move_right") != 0:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("move_right") - event.get_action_strength("move_left")) * 50
	else:
		if event.is_action_released("move_up") or event.is_action_released("move_down"):
			$YProgress.value = 50
		elif event.is_action_released("move_left") or event.is_action_released("move_right"):
			$XProgress.value = 50
		
		
		
	
