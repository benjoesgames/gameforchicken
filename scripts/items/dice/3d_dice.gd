extends DiceBase
class_name Dice3D

@export var dice_scene : PackedScene

func _custom_use_item() -> void:
	#TODO: make 3d dice
	value = 0
	item_used.emit(value)
