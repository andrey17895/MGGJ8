extends Scene

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var camera: Camera2D = $Camera2D

func _ready():
    animation.play("move")
    await animation.animation_finished
    camera.zoom = Vector2(1, 1)
    _end_scene()
