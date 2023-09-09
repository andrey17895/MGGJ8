extends Scene

@export var sprites: Array[Node2D] = []
@export var comments: Array[Control] = []

var index = 0

func _ready():
	assert(sprites.size() == comments.size(), "Unequal number of elements in sprites and comments")

func _unhandled_input(event):
	if Input.is_action_just_pressed("accept_or_click"):
		if index == sprites.size():
			_end_scene()
			return
		sprites[index].visible = false
		comments[index].visible = false
		index += 1
		sprites[index].visible = true
		comments[index].visible = true
	pass

