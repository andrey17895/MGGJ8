extends Scene

@export var sprites: Array[Node2D] = []
@export var comments: Array[Control] = []

var index = 1

func _ready():
	assert(sprites.size() == comments.size(), "Unequal number of elements in sprites and comments")
	_show_picture(0)
	

func _show_picture(num: int) -> void:
	for i in range(sprites.size()):
		sprites[i].visible = false
		comments[i].visible = false
	sprites[num].visible = true
	comments[num].visible = true


func _unhandled_input(event):
	if Input.is_action_just_pressed("accept_or_click"):
		if index == sprites.size():
			_end_scene()
			return
		_show_picture(index)
		index += 1
