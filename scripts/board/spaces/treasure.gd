extends SpaceBase
class_name TreasureSpace

func step_on(user_id : int) -> void:
	step_start.emit()
	GlobalValues.battle_manager.add_treasures(user_id, 1)
	call_deferred("_done_step")
