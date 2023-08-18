extends Area2D
class_name Character

@export var polygon: Polygon2D

func hit() -> void:
	var original_color = polygon.color
	polygon.color = Color.WHITE
	await get_tree().create_timer(0.1).timeout
	polygon.color = original_color
