extends StateBase
class_name Initialize

@export var player_data : PlayerData
@export var inventory_size : int = 6
@export var default_dice : DiceBase

@export_category('States')
@export var first_state : StateBase

func _custom_enter() -> void:
	# TODO: put animation and shit here and trigger intro_ended from that
	print('INTRO')
	# setup for the game
	if GlobalValues.player_data == null:
		GlobalValues.player_data = player_data
	if GlobalValues.inventory == null or GlobalValues.inventory.size() < inventory_size:
		_initialize_inventory()
	
	call_deferred("intro_ended")

func intro_ended() -> void:
	state_machine.change_state(first_state)

func _initialize_inventory() -> void:
		GlobalValues.inventory = []
		for i in inventory_size:
			GlobalValues.inventory.append(null)
		GlobalValues.inventory[0] = default_dice
