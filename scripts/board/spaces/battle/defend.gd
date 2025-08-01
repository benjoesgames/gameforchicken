extends BattleSpaceBase
class_name DefendSpace

func step_on(user_id : int) -> void:
	step_start.emit()
	battle_manager.add_defends(user_id, 1)
	call_deferred("_done_step")
