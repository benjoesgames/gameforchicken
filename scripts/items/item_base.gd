extends Resource
class_name ItemBase

@export var uses : int = 0
@export var description : String = "[Item description goes here]"
@export var icon : Texture2D

signal item_used()
signal item_depleted()

func use_item() -> void:
	if uses > 0:
		uses -= 1
		_custom_use_item()
	item_used.emit()
	if uses <= 0:
		item_depleted.emit()

func _custom_use_item() -> void:
	pass
