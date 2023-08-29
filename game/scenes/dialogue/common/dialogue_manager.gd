extends Node2D

@export_file("*.json") var file_path: String
@export var left_texture: Texture
@export var right_texture: Texture

@onready var dialogue_box: DialogueBox = $DialogueBox
@onready var left_character: NovelCharacter = $LeftCharacter
@onready var right_character: NovelCharacter = $RightCharacter

signal dialogue_ended

var lines: Array[DialogueLine]
var index: int = 0


func _ready() -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	lines = DialogueParser.parse_text(file.get_as_text())
	draw_dialogue_line(get_next_index())
	left_character.texture = left_texture
	right_character.texture = right_texture
	right_character.flip_h = true


func _end_dialogue():
	dialogue_ended.emit()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click") or event.is_action_released("ui_accept"):
		if dialogue_box.is_typing:
			dialogue_box.skip_typing()
		else:
			draw_dialogue_line(get_next_index())


func get_next_index() -> int:
	var result = index
	index += 1
	return result
		
		
func draw_dialogue_line(i: int) -> void:
	if i < lines.size():
		var line = lines[i]
		if line.position == "left":
			left_character.change_image(line.name, line.emotion)
			if not left_character.is_active:
				left_character.is_active = true
				right_character.is_active = false
		elif line.position == "right":
			right_character.change_image(line.name, line.emotion)
			if not right_character.is_active:
				right_character.is_active = true
				left_character.is_active = false
		dialogue_box.draw_dialogue_line(line)
	else:
		dialogue_ended.emit()
		return


func _on_dialogue_ended() -> void:
	visible = false
	set_process(false)


func _on_dialogue_box_typing_ended():
	pass
