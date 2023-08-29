extends Sprite2D
class_name NovelCharacter


func change_image(character: String, emotion: String) -> void:
    var image_name = character + "_" + emotion
    texture = load("res://scenes/dialogue/characters/" + image_name + ".png")