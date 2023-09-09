extends Node

func _ready():
    print(OS.get_user_data_dir())

func _input(event):
    if event.is_action_pressed("screenshot"):
        print("screenshot taken")
        get_viewport().get_texture().get_image().save_png("user://screenshot_" + str(Time.get_ticks_msec()) + ".png")
