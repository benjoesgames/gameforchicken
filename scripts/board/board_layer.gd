extends Resource
class_name BoardLayer

@export var space_settings : Dictionary[NodePath, int] = {}

var num_of_spaces : int : get = _get_num_of_spaces

func _get_num_of_spaces() -> int:
	var result : int = 0
	for s in space_settings:
		result += space_settings[s]
	return result
