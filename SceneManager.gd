extends Node

@export var scenes: Array[PackedScene]


var index: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(scenes[0].instantiate())
	get_child(0).scene_ended.connect(_on_scene_ended)


func _on_scene_ended():
	remove_child(get_child(0))
	add_child(scenes[index].instantiate())
	get_child(0).scene_ended.connect(_on_scene_ended)
	index += 1
	index %= scenes.size()
