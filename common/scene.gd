extends Node2D
class_name Scene

signal scene_ended

func _end_scene():
	scene_ended.emit()
