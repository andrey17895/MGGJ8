extends ShootPattern
class_name CircularShootPattern

func _shoot_pattern(shooter: Vector2, target: Vector2) -> void:
	var direction := Vector2.LEFT
	var angle = deg_to_rad(15)
	for i in 45:
		_shoot(direction)
		_shoot(direction.rotated(PI/2))
		_shoot(direction.rotated(-PI/2))
		_shoot(direction.rotated(PI))
		direction = direction.rotated(deg_to_rad(5))
		direction = direction.rotated(angle)
		await get_tree().create_timer(0.1).timeout

	
func _prepare() -> Dictionary:
	return {
		"movement": false,
		"pacing": 6
	}

