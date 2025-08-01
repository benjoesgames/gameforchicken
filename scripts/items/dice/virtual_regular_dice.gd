extends Virtual_Dice
class_name Virtual_Regular_Dice

func use_item() -> void:
	# ignore use number
	_custom_use_item()
	item_used.emit()
