extends Scene
class_name MainMenu

@onready var background: Sprite2D = $Background
@onready var particles: CPUParticles2D = $Particles


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	particles.emitting = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	background.rotate(0.2 * delta)
	


func _on_quit_pressed() -> void:
	print("quit")
	get_tree().quit()


func _on_new_game_button_pressed() -> void:
	_end_scene()


func _on_pulse_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($Background, "scale", Vector2(4, 4), 0.1).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Background, "scale", Vector2(1.5, 1.5), 0.1).set_trans(Tween.TRANS_SINE)

