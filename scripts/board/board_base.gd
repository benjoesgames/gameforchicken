extends Node
class_name BoardBase

@export var auto_generate : bool = true
@export var layer_settings : Array[BoardLayer] = []

var board : Array[Array] = []

signal on_board_generated()

func _ready() -> void:
	if auto_generate:
		call_deferred("generate_board")

func generate_board() -> void:
	for l in layer_settings.size():
		board.append([])
		for s in layer_settings[l].space_settings:
			for x in layer_settings[l].space_settings[s]:
				var new_space : SpaceBase = get_node(s).duplicate()
				board[l].append(new_space)
	_custom_generate_board()
	on_board_generated.emit()
	
func _custom_generate_board() -> void:
	pass

func get_layer_size(layer : int) -> int:
	if layer >= board.size():
		return -1
	else:
		return board[layer].size()

func get_space(layer : int, space : int) -> SpaceBase:
	if layer >= board.size():
		return null
	elif space >= board[layer].size():
		return null
	else:
		return board[layer][space]
