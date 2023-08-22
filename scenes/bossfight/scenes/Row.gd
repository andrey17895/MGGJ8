extends ShootPattern
class_name RowShootPattern

func _shoot_pattern(shooter: Vector2, target: Vector2) -> void:
	for i in 4:
		_shoot(shooter.direction_to(target))
		await get_tree().create_timer(0.2).timeout
	
	
func _prepare() -> Dictionary:
	return {
		"movement": true,
		"pacing": 2
	}
	
