extends SpaceBase
class_name BattleSpace

@export var game_state_manager: StateMachine
@export var game_state: StateBase
@export var mini_game_state: StateBase

func step_on(_user_id : int) -> void:
	step_start.emit()
	call_deferred("set_mini_game")

func set_mini_game() -> void:
	game_state_manager.change_state(mini_game_state)
	game_state.on_enter.connect(func():
		call_deferred("_done_step"), CONNECT_ONE_SHOT)
