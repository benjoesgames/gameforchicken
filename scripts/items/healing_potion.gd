extends ItemBase
class_name HealthPotion

@export var healing_value : int = 1

func _custom_use_item() -> void:
	GlobalValues.player_data.health += healing_value
	print("Healed player for: ", healing_value)
