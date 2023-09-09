extends Area2D
class_name Character

@export var polygon: Polygon2D
@export var max_health: float = 100
@export var start_health: float = 100
@export var collision: CollisionShape2D

@onready var original_color = polygon.color

var is_alive = true

@onready var health: float = max_health:
	set(value):
		if value <= 0:
			health = 0
			health_changed.emit(0)
			_kill_character()
				
		else:
			health = value
			health_changed.emit(health / max_health * 100)

signal health_changed(percent: float)
signal character_killed

func _ready():
	self.health = start_health

func hit(damage: int) -> void:
	self.health -= damage
	if health > 0:
		_hit_animation()


func _hit_animation() -> void:
	pass

func _kill_character():
	collision.set_deferred("disabled", true)
	character_killed.emit()

func _kill_animation():
	pass
	
