extends SpaceBase
class_name TransitionSpace

@export var move_player : Move
@export var transition_state : StateBase
@export var quest_manager : QuestManager

func step_on(_user_id : int) -> void:
	step_start.emit()
	if quest_manager.quests_done:
		move_player.state_machine.change_state(transition_state)
	call_deferred("_done_step", quest_manager.quests_done)

func pass_by(_user_id : int) -> void:
	pass_start.emit()
	if quest_manager.quests_done:
		move_player.state_machine.change_state(transition_state)
	call_deferred("_done_pass", quest_manager.quests_done)
