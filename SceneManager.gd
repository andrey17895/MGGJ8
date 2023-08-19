extends Node

@export var scenes: Array[PackedScene]

@onready var animation: AnimationPlayer = $Animation
@onready var scene: Node = $Scene

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

func _change_scene_to(scene: PackedScene) -> void:
	animation.play("fade_in")
	await animation.animation_finished
	current_scene.queue_free()
	current_scene = _load_scene(scene)
	animation.play("fade_out")
	await animation.animation_finished


func _on_scene_ended():
	index += 1
	index %= scenes.size()
	_change_scene_to(scenes[index])
	
	
func _on_scene_restarted():
	_change_scene_to(scenes[index])
