extends Character
class_name Enemy

@export var speed: float = 300
@export var travel: int = 150
@export var target: Node2D
@export var kill_animation: String = "enemy_death"

@export var projectile_scene: PackedScene

@onready var muzzle: Marker2D = $Muzzle
@onready var fire_timer: Timer = $FireTimer
@onready var animation: AnimationPlayer = $EnemyAnimationPlayer
@onready var pattern_manager: PatternManager = $PatternManager
@onready var projectiles: Node = $Projectiles


var current_pattern: ShootPattern

var is_ready: bool = false

var initial_position: Vector2

var is_moving: bool = true


func _ready() -> void:
	initial_position = self.position
	pattern_manager._switch_pattern()
	self.health = start_health

func _physics_process(delta: float) -> void:
	if is_moving:
		position += Vector2(0, speed * delta)
		if initial_position.distance_to(position) > travel:
			speed *= -1
	
func _spawn_projectile(direction: Vector2) -> void:
	var projectile = projectile_scene.instantiate()
	projectile.direction = direction
	projectile.position = muzzle.global_position
	projectiles.add_child(projectile)

func _on_fire_timer_timeout() -> void:
	if current_pattern:
		current_pattern._shoot_pattern(position, target.position)
	pass

func _hit_animation() -> void:
	animation.play("enemy_hit")

func _kill_animation() -> void:
	set_physics_process(false)
	fire_timer.stop()
	animation.play(kill_animation)
	await animation.animation_finished


func _on_pattern_manager_shoot(direction: Vector2) -> void:
	_spawn_projectile(direction)


func _on_pattern_manager_pattern_switched(pattern: ShootPattern) -> void:
	current_pattern = pattern
	var setup = current_pattern._prepare()
	is_moving = setup["movement"]
	fire_timer.wait_time = setup["pacing"]


func _on_character_killed():
	for node in projectiles.get_children(true):
		node.queue_free()
