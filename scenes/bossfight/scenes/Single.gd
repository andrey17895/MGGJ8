extends ShootPattern
class_name SingleShootPattern

func _shoot_pattern(shooter: Vector2, target: Vector2) -> void:
	_shoot(shooter.direction_to(target))
	
func _prepare() -> Dictionary:
	return {
		"movement": true,
		"pacing": 0.5
	}
