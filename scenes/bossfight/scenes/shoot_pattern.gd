extends Node
class_name ShootPattern

signal shoot(direction: Vector2)

func _prepare() -> Dictionary:
	return {}
	
func _shoot_pattern(shooter: Vector2, target: Vector2) -> void:
	pass

func _shoot(direction: Vector2) -> void:
	shoot.emit(direction)
