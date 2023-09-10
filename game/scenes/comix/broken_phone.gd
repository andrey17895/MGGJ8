extends Scene

@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready():
    animation.play("move")
    await animation.animation_finished
    _end_scene()