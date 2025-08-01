extends BoardBase
class_name BattleBoard

@export var start_space : SpaceBase

@export var layer_positions : Array[Node3D] = []
@export var center : Node3D
@export var board_node : Node3D

var board_nodes : Array[Array] = []

func _custom_generate_board() -> void:
	for l in board.size():
		board_nodes.append([])
		board[l].shuffle()
		board[l].push_front(start_space)
		var space_size : int = board[l].size()
		for s in space_size:
			var space : SpaceBase = board[l][s]
			var new_space : Node3D = space.duplicate()
			board_nodes[l].append(new_space)
			board_node.add_child(new_space)
			new_space.show()
			center.rotation_degrees = Vector3(0, (360.0 / space_size) * s, 0)
			new_space.global_position = layer_positions[l].global_position
			new_space.global_rotation_degrees = layer_positions[l].global_rotation_degrees
