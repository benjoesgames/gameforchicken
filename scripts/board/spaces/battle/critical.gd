extends BattleSpaceBase
class_name CriticalSpace

func step_on(user_id : int) -> void:
	step_start.emit()
	battle_manager.add_attack(user_id, 2)
	call_deferred("_done_step")
