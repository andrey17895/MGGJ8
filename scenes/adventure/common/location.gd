extends Node2D
class_name Location

signal adventure_finished

func _ready() -> void:
	adventure_finished.connect(get_parent().get_parent().on_adventure_finished)

func _finish_adventure():
	print("adv fin emited")
	adventure_finished.emit()
