extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 500
var inherited_velocity: Vector2 = Vector2.ZERO
var inherited_speed: Vector2 = Vector2(50, 150)
var damage: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction_movement = direction.normalized() * speed * delta
	# var inherited_movement = inherited_velocity * inherited_speed * delta
	position += direction_movement


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.hit(damage)
		queue_free()
