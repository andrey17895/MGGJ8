extends Node2D
class_name DialogueWindow

@export_file("*.json") var file_path: String
@onready var name_label: Label = %Name
@onready var text_label: Label = %Text
@onready var typing_timer: Timer = %TypingTimer

signal dialogue_ended

var lines: Array
var is_typing: bool
var index: int = 0
var line_length: int


func _ready() -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	lines = JSON.parse_string(file.get_as_text())
	draw_dialogue_line(get_next_line())


func _end_dialogue():
	dialogue_ended.emit()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("click"):
		if is_typing:
			text_label.visible_characters = -1
			typing_timer.stop()
			is_typing = false
		else:
			draw_dialogue_line(get_next_line())


func get_next_line():
	if index < lines.size():
		var result = lines[index]
		index += 1
		return result
	else:
		_end_dialogue()
		return null
		
		
func draw_dialogue_line(line) -> void:
	if line:
		name_label.text = line["name"]
		text_label.text = line["line"]
		line_length = text_label.text.length()
		text_label.visible_characters = 1
		is_typing = true
		typing_timer.start()


func _on_dialogue_ended() -> void:
	visible = false
	set_process(false)


func _on_typing_timer_timeout():
	text_label.visible_characters += 1
	if text_label.visible_characters == line_length:
		is_typing = false
		typing_timer.stop()
