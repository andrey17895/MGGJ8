extends CharacterBody2D
class_name Box

signal picked(box: Box)

var speed = 450

var is_picked := false

func _physics_process(delta):
	if is_picked and global_position.distance_to(get_global_mouse_position()) > 10:
		velocity = global_position.direction_to(get_global_mouse_position()).normalized() * speed
		move_and_slide()


func _on_area_2d_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# is_picked = event.is_pressed()
		if event.is_pressed():
			is_picked = true
			picked.emit(self)


func drop(target_position: Vector2):
	is_picked = false
	position = target_position
