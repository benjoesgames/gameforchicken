extends StateBase
class_name ActivateSpace

@export var user_id : int

@export_category("States")
@export var use_item : StateBase

var current_space : SpaceBase

func _custom_enter() -> void:
	current_space.step_on(user_id)
	current_space.step_done.connect(step_done, CONNECT_ONE_SHOT)

func step_done(redirect : bool) -> void:
	if not redirect:
		state_machine.change_state(use_item)
