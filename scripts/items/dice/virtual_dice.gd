extends DiceBase
class_name Virtual_Dice

@export var values : Array[int] = []

func _custom_use_item() -> void:
	value = values.pick_random()
	print("Virtual dice used: ", value)
