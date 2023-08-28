extends Node2D

@export_file("*.json") var file_path: String

@onready var dialogue_box: DialogueBox = $DialogueBox

signal dialogue_ended

var lines: Array[DialogueLine]
var index: int = 0


func _ready() -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	var parsed_dialogue = JSON.parse_string(file.get_as_text())
	for entry in parsed_dialogue:
		var line = DialogueLine.new()
		line.name = entry["name"]
		line.line = entry["line"]
		lines.append(line)
	draw_dialogue_line(get_next_line())


func _end_dialogue():
	dialogue_ended.emit()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click") or event.is_action_released("ui_accept"):
		if dialogue_box.is_typing:
			dialogue_box.skip_typing()
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
		
		
func draw_dialogue_line(line: DialogueLine) -> void:
	dialogue_box.draw_dialogue_line(line)


func _on_dialogue_ended() -> void:
	visible = false
	set_process(false)


func _on_dialogue_box_typing_ended():
	pass
