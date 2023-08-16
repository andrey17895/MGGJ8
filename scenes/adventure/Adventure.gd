extends Scene

@export var start_location: PackedScene

@onready var location_manager: Node = $LocationManager

func _ready() -> void:
	load_loaction(start_location)
			

func load_loaction(location: PackedScene):
	location_manager.add_child(location.instantiate())
	for node in get_tree().get_nodes_in_group("door"):
		if node is Door:
			(node as Door).location_exited.connect(_on_location_exited)
	

func _on_location_exited(location: PackedScene):
	location_manager.remove_child(location_manager.get_child(0))
	load_loaction(location)

func on_adventure_finished():
	print("finish adventure handled")
	_end_scene()
