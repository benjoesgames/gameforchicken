extends Node
class_name StateBase

var state_machine : StateMachine : get = _get_state_machine
var active : bool = false

signal on_enter()
signal on_exit()

func _get_state_machine() -> StateMachine:
	var parent = get_parent()
	while parent != null and not parent is StateMachine:
		parent = parent.get_parent()
	return parent

func _enter() -> void:
	active = true
	_custom_enter()
	on_enter.emit()

func _exit() -> void:
	active = false
	_custom_exit()
	on_exit.emit()

func _custom_enter() -> void:
	pass

func _custom_exit() -> void:
	pass

func _custom_process(_delta : float) -> void:
	pass

func _custom_physics_process(_delta : float) -> void:
	pass

func _custom_input(_event : InputEvent) -> void:
	pass
