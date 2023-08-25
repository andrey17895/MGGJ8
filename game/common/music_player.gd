extends Node

@onready var background_music: AudioStreamPlayer = $BackgroundMusic

func play():
	background_music.play()
	
func stop():
	background_music.stop()