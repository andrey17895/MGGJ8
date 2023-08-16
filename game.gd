extends Node

@onready var pause_menu: Control = $PauseMenu

var mouse_mode: Input.MouseMode

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		mouse_mode = Input.mouse_mode
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
		pause_menu.visible = true

func _on_resume_button_pressed() -> void:
	Input.mouse_mode = mouse_mode
	get_tree().paused = false
	pause_menu.visible = false


func _on_quit_button_pressed() -> void:
	get_tree().quit()
