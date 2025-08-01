extends Camera3D
class_name CameraController

@export var move_time : float = 1.0
@export var default_camera : Node3D
@export var tween_curve : Curve

var current_node : Node3D
var tween_timer : float = 0.0
var tween_time : float = 0.0

func _init() -> void:
	GlobalValues.values[GlobalNames.MAIN_CAMERA] = self

func _ready() -> void:
	if default_camera:
		move_to_node(default_camera)

func move_to_node(node : Node3D, time : float = 0.0) -> void:
	if time <= 0.0:
		time = move_time
	tween_time = time
	tween_timer = 0.0
	current_node = node

func _process(delta: float) -> void:
	if not current_node: return
	if tween_timer >= tween_time:
		global_position = current_node.global_position
		global_rotation = current_node.global_rotation
	else:
		tween_timer += delta
		var tween_value : float = tween_timer / tween_time
		global_position = lerp(global_position, current_node.global_position, tween_curve.sample(tween_value))
		global_rotation = lerp(global_rotation, current_node.global_rotation, tween_curve.sample(tween_value))
