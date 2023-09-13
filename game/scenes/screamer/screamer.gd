extends Scene

@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready():
    MusicPlayer.stop()
    animation.play("scream")
    await animation.animation_finished
    _end_scene()
