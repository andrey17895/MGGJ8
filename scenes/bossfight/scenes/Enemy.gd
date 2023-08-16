extends Area2D

@export var speed: float = 300
@export var travel: int = 150

@onready var animation: AnimationPlayer = $AnimationPlayer

var initial_position: Vector2


func hit() -> void:
	animation.play("hit")
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_position = self.position
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	position += Vector2(0, speed * delta)
	if initial_position.distance_to(position) > travel:
		speed *= -1
	
