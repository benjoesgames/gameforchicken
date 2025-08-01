extends Node

const SCENE_MANAGER = preload("res://scenes/managers/scene_manager.tscn")

var scene_controller : SceneController : get = _get_scene_controller

func _get_scene_controller() -> SceneController:
	if not scene_controller:
		scene_controller = SCENE_MANAGER.instantiate()
		add_child(scene_controller)
	return scene_controller

func load_scene(scene : PackedScene) -> void:
	# TODO: unoad, fade, stuff
	scene_controller.fade_in()
	scene_controller.fade_animation.animation_finished.connect(func(_anim : String):
		get_tree().change_scene_to_packed(scene)
		await get_tree().create_timer(1).timeout
		scene_controller.fade_out(), CONNECT_ONE_SHOT)

func set_background_music(stream : AudioStream) -> void:
	var tween = get_tree().create_tween()
	tween.tween_method(func(value : float):
		if value > 0:
			AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)
		if value < 0:
			AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), -value)
		if value < 0.01 and scene_controller.background_music.stream != stream:
			scene_controller.background_music.stop()
			scene_controller.background_music.stream = stream
			scene_controller.background_music.play()
			, 1.0, -1.0, 3.0)
