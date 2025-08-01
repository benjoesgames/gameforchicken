extends Resource
class_name PlayerData

@export var max_health : int = 10

var health : int : set = _set_health
var attacks : int = 0 : set = _set_attacks
var defends : int = 0 : set = _set_defends
var treasures : int = 0 : set = _set_treasure

signal dead()
signal health_changed(new_value : int)
signal attacks_changed(new_value : int)
signal defends_changed(new_value : int)
signal treasures_changed(new_value : int)

func _init():
	call_deferred("ready")

func ready():
	health = max_health

func _set_health(value : int) -> void:
	health = value
	health_changed.emit(value)
	
func _set_attacks(value : int) -> void:
	attacks = value
	attacks_changed.emit(value)

func _set_defends(value : int) -> void:
	defends = value
	defends_changed.emit(value)

func _set_treasure(value : int) -> void:
	treasures = value
	treasures_changed.emit(value)

func damage(value : int) -> void:
	health = max(health - value, 0)
	if health <= 0:
		dead.emit()

func heal(value : int) -> void:
	health = min(health + value, max_health)
