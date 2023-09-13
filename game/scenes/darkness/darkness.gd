extends Scene

var delay = 2

func _ready():
    %s2.visible = true
    await get_tree().create_timer(delay).timeout
    %s2.visible = false
    %s3.visible = true
    await get_tree().create_timer(delay).timeout
    %s3.visible = false
    %s4.visible = true
    await get_tree().create_timer(delay).timeout
    %s4.visible = false
    %s5.visible = true
    await get_tree().create_timer(delay).timeout
    %s5.visible = false
    %s6.visible = true
    await get_tree().create_timer(2).timeout
    _end_scene()
