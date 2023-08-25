extends ShootPattern
class_name CircularShootPattern

var direction := Vector2.LEFT
var angle = deg_to_rad(15)

func _shoot_pattern(_shooter: Vector2, _target: Vector2) -> void:
	_shoot(direction)
	_shoot(direction.rotated(PI/2))
	_shoot(direction.rotated(-PI/2))
	_shoot(direction.rotated(PI))
	direction = direction.rotated(angle)
	await get_tree().create_timer(0.1).timeout

	
func _prepare() -> Dictionary:
	return {
		"movement": false,
		"pacing": 0.1
	}

