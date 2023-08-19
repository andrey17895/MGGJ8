extends Node2D
class_name Scene

signal scene_ended
signal scene_restarted

func _end_scene():
	print_debug("end scene emited")
	scene_ended.emit()

func _restart_scene():
	print_debug("restart scene emited")
	scene_restarted.emit()
