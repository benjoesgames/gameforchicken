extends Node
class_name BattleManager

@export var enemies : Array[PlayerData] = []

@export_category("States")
@export var state_machine : StateMachine
@export var die_state : StateBase
@export var win_state : StateBase
@export var move_scripts : Array[Move]
@export var roll_scripts : Array[StateBase]

var battle_data : Array[PlayerData] = []

var finished : bool = false

func _ready() -> void:
	finished = false
	battle_data = enemies.duplicate()
	battle_data.push_front(GlobalValues.player_data)
	for p in battle_data.size():
		battle_data[p].dead.connect(_player_died.bind(p), CONNECT_ONE_SHOT)

func add_attack(player : int, attacks : int) -> void:
	print("Player %s gets %s attack(s)" % [player, attacks])
	if player >= battle_data.size(): return
	battle_data[player].attacks += attacks

func add_defends(player : int, defends : int) -> void:
	print("Player %s gets defend" % player)
	if player >= battle_data.size(): return
	battle_data[player].defends += defends

func add_treasures(player : int, treasures : int) -> void:
	print("Player %s gets treasure" % player)
	if player >= battle_data.size(): return
	battle_data[player].treasures += treasures

func run_action(player : int) -> void:
	print("ACTION!")
	for m in move_scripts:
		m.current_space = 0
	
	var other = abs(player - 1)
	
	if not finished:
		var attacks = battle_data[player].attacks
		var defends = battle_data[other].defends
		var damage = max(attacks - defends, 0)
		battle_data[other].damage(damage)
	
	if not finished:
		var attacks = battle_data[other].attacks
		var defends = battle_data[player].defends
		var damage = max(attacks - defends, 0)
		battle_data[player].damage(damage)
	
	for b in battle_data:
		b.attacks = 0
		b.defends = 0
	
	if not finished:
		state_machine.change_state(roll_scripts[other])

func _player_died(player : int) -> void:
	finished = true
	print("Player %s died!" % player)
	if player == 0:
		state_machine.change_state(die_state)
	else:
		state_machine.change_state(win_state)
