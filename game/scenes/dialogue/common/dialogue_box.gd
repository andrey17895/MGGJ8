extends Node2D
class_name DialogueBox

@onready var name_label: Label = %Name
@onready var text_label: Label = %Text
@onready var typing_timer: Timer = %TypingTimer

signal typing_ended

var is_typing: bool
var index: int = 0
var line_length: int


func _ready() -> void:
	pass


func skip_typing() -> void:
	if is_typing:
		text_label.visible_characters = -1
		_end_typing()



func draw_dialogue_line(line: DialogueLine) -> void:
	if line:
		name_label.text = line.name
		text_label.text = line.line
		line_length = text_label.text.length()
		text_label.visible_characters = 1
		is_typing = true
		typing_timer.start()


func _on_typing_timer_timeout():
	if text_label.visible_characters == line_length:
		_end_typing()
	text_label.visible_characters += 1
	

func _end_typing() -> void:
	is_typing = false
	typing_timer.stop()
	typing_ended.emit()
