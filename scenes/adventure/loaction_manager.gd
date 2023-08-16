extends Node

@export var start_location: String = "res://scenes/adventure/locations/forest/forest.tscn"

signal adventure_ended

func _ready() -> void:
	load_loaction(start_location)
			

func load_loaction(location: String):
	add_child(load(location).instantiate())
	#get_child(0).connect("adventure_finished", on_adventure_finished)
	for node in get_tree().get_nodes_in_group("door"):
		if node is Door:
			(node as Door).location_exited.connect(_on_location_exited)
	

func _on_location_exited(location: String):
	remove_child(get_child(0))
	load_loaction(location)

func on_adventure_finished():
	print("finish adventure handled")
	adventure_ended.emit()
