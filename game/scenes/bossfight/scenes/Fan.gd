extends ShootPattern
class_name FanShootPattern

func _shoot_pattern(shooter: Vector2, target: Vector2) -> void:
	var direction := shooter.direction_to(target)
	var angle = deg_to_rad(12)
	_shoot(direction.rotated(-angle * 3))
	_shoot(direction.rotated(-angle * 2))
	_shoot(direction.rotated(-angle))
	_shoot(direction)
	_shoot(direction.rotated(angle))
	_shoot(direction.rotated(angle * 2))
	_shoot(direction.rotated(angle * 3))
	
	
func _prepare() -> Dictionary:
	return {
		"movement": true,
		"pacing": 1.5
	}

