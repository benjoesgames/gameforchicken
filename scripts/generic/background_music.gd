extends Node
class_name BackgroundMusic

@export var background_audio : AudioStream

func _ready() -> void:
	SceneManager.set_background_music(background_audio)
