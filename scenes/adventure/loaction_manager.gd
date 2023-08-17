extends Node
class_name LocationManager

@export var start_location: Location = Location.Room

signal adventure_ended

enum Location {
	Room,
	Forest
}

var locations: Dictionary = {
	Location.Room: "res://scenes/adventure/locations/room/room.tscn",
	Location.Forest: "res://scenes/adventure/locations/forest/forest.tscn"
}

var current_scene: LocationScene

func _ready() -> void:
	load_loaction(start_location)
			

func load_loaction(location: Location):
	
	current_scene = load(locations[location]).instantiate() as LocationScene
	add_child(current_scene)
	
	current_scene.adventure_finished.connect(_on_adventure_finished)
	
	for node in get_tree().get_nodes_in_group("door"):
		if node is Door:
			(node as Door).location_exited.connect(_on_location_exited)
	

func _on_location_exited(location: Location):
	current_scene.queue_free()
	load_loaction(location)

func _on_adventure_finished():
	print("finish adventure handled")
	adventure_ended.emit()
