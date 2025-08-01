extends StateBase
class_name Move

@export var user_id : int
@export var board : BattleBoard

@export_category('States')
@export var activate_space : StateBase

var current_space : int = 0 : set = _set_current_space
var current_layer : int = 0 : set = _set_current_layer
var dice : DiceBase

var current_space_node : Node3D : get = _get_current_space_node

signal on_take_step(new_position : int)
signal current_space_changed(new_value : int)
signal layer_changed(new_layer : int)

func _get_current_space_node() -> Node3D:
	if board and board.board_nodes.size() > current_layer and board.board_nodes[current_layer].size() > current_space:
		return board.board_nodes[current_layer][current_space]
	return null

func _set_current_layer(value : int) -> void:
	current_layer = value
	layer_changed.emit(value)
	
func _set_current_space(value : int) -> void:
	var new_value : int = value % board.get_layer_size(current_layer)
	current_space = new_value
	current_space_changed.emit(new_value)

func _custom_enter() -> void:
	take_step(false, dice.value)

func take_step(redirect : bool, steps : int) -> void:
	if redirect: return
	current_space += 1
	on_take_step.emit(current_space)
	await get_tree().create_timer(.5).timeout
	var space : SpaceBase = board.get_space(current_layer, current_space)
	if steps <= 1:
		activate_space.current_space = space
		state_machine.change_state(activate_space)
	else:
		space.pass_by(user_id)
		var steps_left : int = steps - 1
		space.pass_done.connect(take_step.bind(steps_left), CONNECT_ONE_SHOT)
