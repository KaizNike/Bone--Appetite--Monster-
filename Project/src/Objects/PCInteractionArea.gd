extends Area

var interact_priority = 1
var targetted := false setget targetted_changed

signal change_target_status(Bool)

func targetted_changed(new_val):
	emit_signal("change_target_status", new_val)
	targetted = new_val
