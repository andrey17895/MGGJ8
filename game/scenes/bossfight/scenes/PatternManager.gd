extends Node
class_name PatternManager

signal shoot(direction: Vector2)
signal pattern_switched(pattern: ShootPattern)

enum AttackType { SINGLE, ROW, FAN, CIRCLE }

@export var attack_type_array: Array[ShootPattern] = []
var current_pattern: ShootPattern
var attack_type_index = 0

@onready var patterns: Node = $Patterns

func _ready() -> void:
	if attack_type_array.size() == 0:
		for node in patterns.get_children():
			if node is ShootPattern:
				var pattern = node as ShootPattern
				attack_type_array.append(pattern)

	assert(attack_type_array.size() > 0, "Add elements to attack_type_array")

	for pattern in attack_type_array:
		pattern.shoot.connect(_on_pattern_shoot)
	
	
func _on_pattern_shoot(direction: Vector2) -> void:
	_shoot(direction)
	pass

func _shoot(direction: Vector2) -> void:
	shoot.emit(direction)

func _switch_pattern() -> void:
	if attack_type_index == 0:
		attack_type_array.shuffle()
	current_pattern = attack_type_array[attack_type_index]
	pattern_switched.emit(current_pattern)
	attack_type_index += 1
	attack_type_index %= attack_type_array.size()



func _on_attack_switch_timer_timeout() -> void:
	_switch_pattern()
