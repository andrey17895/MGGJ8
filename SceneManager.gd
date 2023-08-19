extends Node

@export var scenes: Array[PackedScene]

var current_scene: Scene
var index: int = 0

func _ready() -> void:
	current_scene = _load_scene(scenes[0])



func _load_scene(scene: PackedScene) -> Scene:
	var instance = scene.instantiate() as Scene
	add_child(instance)
	instance.scene_ended.connect(_on_scene_ended)
	instance.scene_restarted.connect(_on_scene_restarted)
	return instance


func _on_scene_ended():
	index += 1
	index %= scenes.size()
	current_scene.queue_free()
	current_scene = _load_scene(scenes[index])
	
	
func _on_scene_restarted():
	current_scene.queue_free()
	current_scene = _load_scene(scenes[index])
