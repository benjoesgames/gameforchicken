extends SpaceBase
class_name AttackSpace

func step_on(user_id : int) -> void:
	step_start.emit()
	GlobalValues.battle_manager.add_attack(user_id, 1)
	call_deferred("_done_step")
