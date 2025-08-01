extends BattleSpaceBase
class_name ActionSpace

func step_on(user_id : int) -> void:
	step_start.emit()
	battle_manager.run_action(user_id)
	call_deferred("_done_step", true)

func pass_by(user_id : int) -> void:
	pass_start.emit()
	battle_manager.run_action(user_id)
	call_deferred("_done_pass", true)
