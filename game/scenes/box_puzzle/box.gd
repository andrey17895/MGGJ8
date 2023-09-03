extends CharacterBody2D

var speed = 300

var picked := false

func _physics_process(delta):
    if picked and global_position.distance_to(get_global_mouse_position()) > 10:
        velocity = global_position.direction_to(get_global_mouse_position()).normalized() * speed
        move_and_slide()


func _on_area_2d_input_event(viewport:Node, event:InputEvent, shape_idx:int):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        picked = event.is_pressed()
