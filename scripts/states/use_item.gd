extends StateBase
class_name UseItem

@export_category("States")
@export var move_state : StateBase

func use_item(index : int) -> void:
	if not active: return
	if index < GlobalValues.inventory.size() and GlobalValues.inventory[index]:
		var item = GlobalValues.inventory[index]
		item.item_used.connect(item_used.bind(item), CONNECT_ONE_SHOT)
		item.use_item()

func item_used(item : ItemBase) -> void:
	if item is DiceBase:
		move_state.dice = item
		state_machine.change_state(move_state)

func add_item_to_inventory(index : int, item : ItemBase) -> ItemBase:
	var result : ItemBase = null
	if index >= GlobalValues.inventory.size(): return result
	if GlobalValues.inventory[index]:
		result = GlobalValues.inventory[index]
	GlobalValues.inventory[index] = item
	return result

func remove_item_from_inventory(index : int) -> ItemBase:
	return add_item_to_inventory(index, null)
