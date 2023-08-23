extends Node2D
class_name DialogueWindow

@export_file("*.json") var file_path: String
@onready var name_label: Label = %Name
@onready var text_label: Label = %Text

signal dialogue_ended

var lines: Array

var index: int = 0

func _ready() -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	lines = JSON.parse_string(file.get_as_text())
	draw_dialogue_line(get_next_line())

func _end_dialogue():
	dialogue_ended.emit()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("click"):
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


func _on_dialogue_ended() -> void:
	visible = false
	set_process(false)
