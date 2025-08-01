extends SpaceBase
class_name TimerSpace

@export var step_on_time : float
@export var pass_by_time : float

func step_on(_user_id : int) -> void:
	step_start.emit()
	print('	step on start')
	ScriptTimer.create_timer(step_on_time, func():
		print('	step on end')
		step_done.emit(false))

func pass_by(_user_id : int) -> void:
	pass_start.emit()
	print('	pass by start')
	ScriptTimer.create_timer(pass_by_time, func():
		print('	pass by end')
		pass_done.emit(false))
