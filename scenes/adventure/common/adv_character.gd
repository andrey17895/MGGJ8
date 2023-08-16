extends CharacterBody2D
class_name AdvCharacter

@export var speed: int = 400

@onready var navigation: NavigationAgent2D = $NavigationAgent2D
@onready var luci: Sprite2D = $Luci

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		navigation.target_position = get_global_mouse_position()
		
		
func _physics_process(delta: float) -> void:
	
	var direvtion = navigation.get_next_path_position() - position
	
	var shift = direvtion.normalized() * speed * delta
	
	luci.flip_h = shift.x < 0
	
	if shift.length() > direvtion.length():
		position = navigation.get_next_path_position()
	else:
		position += shift
	
