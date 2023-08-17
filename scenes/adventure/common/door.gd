extends Node2D
class_name Door

@export var door_to: LocationManager.Location

signal location_exited(location: PackedScene)


func _on_area_body_entered(body: Node2D) -> void:
	if body is AdvCharacter:
		print("location_exited emited")
		location_exited.emit(door_to)

