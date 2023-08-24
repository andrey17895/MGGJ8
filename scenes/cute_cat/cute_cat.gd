extends Scene

@onready var progress_bar: TextureProgressBar = $TextureProgressBar
@onready var sprite: Sprite2D = $Sprite2D
@onready var camera: Camera2D = $Camera2D
@onready var push_sfx: AudioStreamPlayer2D = $PushSfx
@onready var win_sfx: AudioStreamPlayer2D = $WinSfx
@onready var end_timer: Timer = $EndTimer
@onready var next_button: Button = $NextButton

@export var cute_cat_texture: CompressedTexture2D

var sprite_initital_position: Vector2

var win = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_initital_position = sprite.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	sprite.scale = Vector2(1 + progress_bar.value/800, 1 + progress_bar.value/800)
	sprite.position = sprite_initital_position + Vector2(-progress_bar.value/1.5, 0)
	push_sfx.pitch_scale = 1 + progress_bar.value/100
	if not win and (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("click")):
		progress_bar.value += 5
		camera.shake(0.1, progress_bar.value / 10)
		push_sfx.play()
	if progress_bar.value == 100:
		win = true
		progress_bar.visible = false
		sprite.modulate = Color(1.0, 0.45, 0.95, 1.0)
		sprite.texture = cute_cat_texture
		win_sfx.play()
		end_timer.start()
		set_process(false)
		
		


func _on_timer_timeout() -> void:
	if not win:
		progress_bar.value -= 0.5



func _on_next_button_pressed() -> void:
	scene_ended.emit()


func _on_end_timer_timeout() -> void:
	next_button.visible = true
