extends Character
class_name Enemy

@export var speed: float = 300
@export var travel: int = 150

@export var projectile_scene: PackedScene

@onready var muzzle: Marker2D = $Muzzle
@onready var fire_timer: Timer = $FireTimer

@onready var target: Node2D = get_tree().get_first_node_in_group("player")


var initial_position: Vector2

enum AttackType { SINGLE, ROW, FAN, CIRCLE }


func _ready() -> void:
	initial_position = self.position
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	position += Vector2(0, speed * delta)
	if initial_position.distance_to(position) > travel:
		speed *= -1
	
func _spawn_projectile(direction: Vector2) -> void:
	var projectile = projectile_scene.instantiate()
	projectile.direction = direction
	projectile.position = muzzle.global_position
	get_parent().add_child(projectile)

func _on_fire_timer_timeout() -> void:
	_shoot_row_pattern()
	pass

func _shoot_single_pattern():
	_spawn_projectile(target.position - position)

func _shoot_row_pattern():
	for i in 4:
		_spawn_projectile(target.position - position)
		await get_tree().create_timer(0.2).timeout
