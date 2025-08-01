extends Node
class_name SceneController

@onready var background_music: AudioStreamPlayer2D = $BackgroundMusic
@onready var fade_animation: AnimationPlayer = $CanvasLayer/ColorRect/FadeAnimation

func _ready() -> void:
	fade_out()

func fade_in() -> void:
	fade_animation.play("fade_in")

func fade_out() -> void:
	fade_animation.play("fade_out")
