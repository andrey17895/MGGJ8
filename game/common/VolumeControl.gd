extends TextureButton



func _on_volume_button_toggled(button_pressed: bool) -> void:
	var master_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_index, button_pressed)
	pass # Replace with function body.
