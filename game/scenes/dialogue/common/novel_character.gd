extends Sprite2D
class_name NovelCharacter

@onready var animation = $AnimationPlayer

var is_active: bool = false:
	set(value):
		if value != is_active:	
			if value:
				animation.play("activate")
			else:
				animation.play("deactivate")
		is_active = value

func change_image(character: String, emotion: String) -> void:
	var image_name = character + "_" + emotion
	texture = load("res://scenes/dialogue/characters/" + image_name + ".png")

