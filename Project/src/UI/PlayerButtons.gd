extends HBoxContainer

var player = 1

func _ready():
	print(player)

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
#	Player 1 Move
	if (event.get_action_strength("move_up") != 0 or event.get_action_strength("move_down") != 0) and player == 1:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("move_up") - event.get_action_strength("move_down")) * 50
	elif (event.get_action_strength("move_left") != 0 or event.get_action_strength("move_right") != 0) and player == 1:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("move_right") - event.get_action_strength("move_left")) * 50
#	Player 2 Move
	elif (event.get_action_strength("p2_move_up") != 0 or event.get_action_strength("p2_move_down") != 0) and player == 2:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p2_move_up") - event.get_action_strength("p2_move_down")) * 50
	elif (event.get_action_strength("p2_move_left") != 0 or event.get_action_strength("p2_move_right") != 0) and player == 2:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p2_move_right") - event.get_action_strength("p2_move_left")) * 50
#	Player 3 Move
	elif (event.get_action_strength("p3_move_up") != 0 or event.get_action_strength("p3_move_down") != 0) and player == 3:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p3_move_up") - event.get_action_strength("p3_move_down")) * 50
	elif (event.get_action_strength("p3_move_left") != 0 or event.get_action_strength("p3_move_right") != 0) and player == 3:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p3_move_right") - event.get_action_strength("p3_move_left")) * 50
#	Player 4 Move
	elif (event.get_action_strength("p4_move_up") != 0 or event.get_action_strength("p4_move_down") != 0) and player == 4:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p4_move_up") - event.get_action_strength("p4_move_down")) * 50
	elif (event.get_action_strength("p4_move_left") != 0 or event.get_action_strength("p4_move_right") != 0) and player == 4:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p4_move_right") - event.get_action_strength("p4_move_left")) * 50
#	Player 5 Move
	elif (event.get_action_strength("p5_move_up") != 0 or event.get_action_strength("p5_move_down") != 0) and player == 5:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p5_move_up") - event.get_action_strength("p5_move_down")) * 50
	elif (event.get_action_strength("p5_move_left") != 0 or event.get_action_strength("p5_move_right") != 0) and player == 5:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p5_move_right") - event.get_action_strength("p5_move_left")) * 50
#	Player 6 Move
	elif (event.get_action_strength("p6_move_up") != 0 or event.get_action_strength("p6_move_down") != 0) and player == 6:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p6_move_up") - event.get_action_strength("p6_move_down")) * 50
	elif (event.get_action_strength("p6_move_left") != 0 or event.get_action_strength("p6_move_right") != 0) and player == 6:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p6_move_right") - event.get_action_strength("p6_move_left")) * 50
#	Player 7 Move
	elif (event.get_action_strength("p7_move_up") != 0 or event.get_action_strength("p7_move_down") != 0) and player == 7:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p7_move_up") - event.get_action_strength("p7_move_down")) * 50
	elif (event.get_action_strength("p7_move_left") != 0 or event.get_action_strength("p7_move_right") != 0) and player == 7:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p7_move_right") - event.get_action_strength("p7_move_left")) * 50
#	Player 8 Move
	elif (event.get_action_strength("p8_move_up") != 0 or event.get_action_strength("p8_move_down") != 0) and player == 8:
		$YProgress.value = 50
		$YProgress.value += (event.get_action_strength("p8_move_up") - event.get_action_strength("p8_move_down")) * 50
	elif (event.get_action_strength("p8_move_left") != 0 or event.get_action_strength("p8_move_right") != 0) and player == 8:
		$XProgress.value = 50
		$XProgress.value += (event.get_action_strength("p8_move_right") - event.get_action_strength("p8_move_left")) * 50
	else:
		# Player 1 Move Reset
		if (event.is_action_released("move_up") or event.is_action_released("move_down")) and player == 1:
			$YProgress.value = 50
		elif (event.is_action_released("move_left") or event.is_action_released("move_right")) and player == 1:
			$XProgress.value = 50
		# Player 2 Move Reset
		elif (event.is_action_released("p2_move_up") or event.is_action_released("p2_move_down")) and player == 2:
			$YProgress.value = 50
		elif (event.is_action_released("p2_move_left") or event.is_action_released("p2_move_right")) and player == 2:
			$XProgress.value = 50
		# Player 3 Move Reset
		elif (event.is_action_released("p3_move_up") or event.is_action_released("p3_move_down")) and player == 3:
			$YProgress.value = 50
		elif (event.is_action_released("p3_move_left") or event.is_action_released("p3_move_right")) and player == 3:
			$XProgress.value = 50
		# Player 4 Move Reset
		elif (event.is_action_released("p4_move_up") or event.is_action_released("p4_move_down")) and player == 4:
			$YProgress.value = 50
		elif (event.is_action_released("p4_move_left") or event.is_action_released("p4_move_right")) and player == 4:
			$XProgress.value = 50
		# Player 5 Move Reset
		elif (event.is_action_released("p5_move_up") or event.is_action_released("p5_move_down")) and player == 5:
			$YProgress.value = 50
		elif (event.is_action_released("p5_move_left") or event.is_action_released("p5_move_right")) and player == 5:
			$XProgress.value = 50
		# Player 6 Move Reset
		elif (event.is_action_released("p6_move_up") or event.is_action_released("p6_move_down")) and player == 6:
			$YProgress.value = 50
		elif (event.is_action_released("p6_move_left") or event.is_action_released("p6_move_right")) and player == 6:
			$XProgress.value = 50
		# Player 7 Move Reset
		elif (event.is_action_released("p7_move_up") or event.is_action_released("p7_move_down")) and player == 7:
			$YProgress.value = 50
		elif (event.is_action_released("p7_move_left") or event.is_action_released("p7_move_right")) and player == 7:
			$XProgress.value = 50
		# Player 8 Move Reset
		elif (event.is_action_released("p8_move_up") or event.is_action_released("p8_move_down")) and player == 8:
			$YProgress.value = 50
		elif (event.is_action_released("p8_move_left") or event.is_action_released("p8_move_right")) and player == 8:
			$XProgress.value = 50
		
		
		
	
