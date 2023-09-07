extends ShootPattern
class_name LaserPattern

@export var laser: PackedScene

func _prepare() -> Dictionary:
	return {
		"movement": false,
		"pacing": 2
	}
	
func _shoot_pattern(shooter: Vector2, target: Vector2) -> void:
	pass