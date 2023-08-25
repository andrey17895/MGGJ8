extends Scene
class_name Bossfight

@export var debug = false
@export var parallax_speed: float = 200

@onready var player: Player = $Player
@onready var player_health: ProgressBar = $PlayerHealth
@onready var enemy_health: ProgressBar = $EnemyHealth
@onready var enemy: Enemy = $Enemy
@onready var parallax: ParallaxBackground = $ParallaxBackground

var top_left: Vector2
var bottom_right: Vector2


func _ready() -> void:
	MusicPlayer.stop()
	top_left = player.top_left
	bottom_right = player.bottom_right
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _process(delta: float) -> void:
	parallax.scroll_offset.x += parallax_speed * delta
	
	
func _on_tree_exiting() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_player_health_changed(percent) -> void:
	player_health.value = percent


func _on_enemy_health_changed(percent) -> void:
	enemy_health.value = percent


func _on_enemy_character_killed() -> void:
	player.set_process(false)
	player.stop_shooting()
	await enemy._kill_animation()
	_end_scene()
	pass


func _on_player_character_killed() -> void:
	player.set_process(false)
	_restart_scene()
	pass
