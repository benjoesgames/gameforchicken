extends Node3D
class_name CameraTarget

var camera : CameraController

func _ready() -> void:
	camera = GlobalValues.values[GlobalNames.MAIN_CAMERA]

func make_camera_follow() -> void:
	if camera:
		camera.move_to_node(self)
		print('set cam to: ', name)
