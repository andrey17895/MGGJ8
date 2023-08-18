extends Area2D

@export var top_left = Vector2(50, 50)
@export var bottom_right = Vector2(800, 600)
@export var projectile_scene: PackedScene

@onready var muzzle: Marker2D = $Muzzle
@onready var iv_label: Label = $InstantVelocity
@onready var polygon: Polygon2D = $Polygon2D

var instant_velocity: Vector2 = Vector2.ZERO
var previous_position: Vector2

var speed: float = 400

var movement_target: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	previous_position = position
	movement_target = position
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		movement_target += event.relative

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = movement_target - position
	var move = direction.normalized() * speed * delta
	instant_velocity = direction.normalized()
	if direction.length() > move.length():
		position += move
	else:
		position += direction
	
	position.x = clamp(position.x, top_left.x, bottom_right.x)
	position.y = clamp(position.y, top_left.y, bottom_right.y)
	
	movement_target.x = clamp(movement_target.x, top_left.x, bottom_right.x)
	movement_target.y = clamp(movement_target.y, top_left.y, bottom_right.y)
	
func _process(_delta: float) -> void:
	iv_label.text = str(instant_velocity)

func hit() -> void:
	var original_color = polygon.color
	polygon.color = Color.WHITE
	await get_tree().create_timer(0.1).timeout
	polygon.color = original_color

func _on_shot_timer_timeout() -> void:
	var projectile = projectile_scene.instantiate()
	projectile.position = muzzle.global_position
	projectile.inherited_velocity = instant_velocity
	get_parent().add_child(projectile)
	pass # Replace with function body.
