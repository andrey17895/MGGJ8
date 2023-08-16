extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 500
var inherited_velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += direction.normalized() * speed * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.hit()
		queue_free()
