extends Node
class_name StateMachine

@export var auto_start : bool = true
@export var start_state : StateBase
@export var active : bool = true : set = set_active

@export_category("Debug")
@export var print_enter : bool = false
@export var print_exit : bool = false

var current_state : StateBase

signal active_set(value : bool)

func _ready() -> void:
	if auto_start:
		start()

func set_active(value : bool) -> void:
	active = value
	active_set.emit(active)

func start() -> void:
	change_state(start_state)

func change_state(next_state : StateBase) -> void:
	if current_state: 
		if print_exit: print("Exit: ", current_state.get_script().get_global_name())
		current_state._exit()
	current_state = next_state
	if print_enter: print("Enter: ", current_state.get_script().get_global_name())
	current_state._enter()

func _process(delta: float) -> void:
	ScriptTimer.update_timers()
	if not active: return
	if current_state: current_state._custom_process(delta)

func _physics_process(delta: float) -> void:
	if not active: return
	if current_state: current_state._custom_physics_process(delta)

func _input(event: InputEvent) -> void:
	if not active: return
	if current_state: current_state._custom_input(event)
