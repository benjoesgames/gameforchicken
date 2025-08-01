extends Node
class_name SpaceBase

signal step_start()
signal pass_start()
signal step_done(redirect : bool)
signal pass_done(redirect : bool)

func step_on(_user_id : int) -> void:
	step_start.emit()
	call_deferred("_done_step")

func pass_by(_user_id : int) -> void:
	pass_start.emit()
	call_deferred("_done_pass")

func _done_pass(redirect : bool = false) -> void:
	pass_done.emit(redirect)

func _done_step(redirect : bool = false) -> void:
	step_done.emit(redirect)
