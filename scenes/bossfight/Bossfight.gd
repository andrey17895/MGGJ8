extends Scene
class_name Bossfight

@export var debug = false

@onready var player: Area2D = $Player

var top_left: Vector2
var bottom_right: Vector2


func _ready() -> void:
	top_left = player.top_left
	bottom_right = player.bottom_right
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_end_scene()

func _on_tree_exiting() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
