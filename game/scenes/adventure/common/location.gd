extends Node2D
class_name LocationScene

signal adventure_finished


func _finish_adventure():
	print("adv fin emited")
	adventure_finished.emit()
