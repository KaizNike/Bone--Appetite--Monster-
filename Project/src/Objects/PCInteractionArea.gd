extends Area

var interact_priority = 1
var interact_type = "pot"
var targetted := false setget targetted_changed
var is_interacting := false setget interacting_changed

signal change_target_status(Bool)
signal change_interact_status(Bool)

func targetted_changed(new_val):
	emit_signal("change_target_status", new_val)
	targetted = new_val

func interacting_changed(new_val):
	emit_signal("change_interact_status", new_val)
	is_interacting = new_val
