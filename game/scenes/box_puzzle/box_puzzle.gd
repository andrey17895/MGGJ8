extends Scene

@onready var field: Node2D = $Field
@onready var label1: Label = $Label
@onready var label2: Label = $Label2
@onready var rage_piece: Box = %BoxHorizontal
@onready var help_me_button: Button = %HelpMeButton
@onready var rect: ColorRect = %ColorRect2


var active_box: Box = null

func _ready():
    _connect_boxes_signals()
    pass
    

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and (event as InputEventMouseButton).is_released() and event.button_index == MOUSE_BUTTON_LEFT:
            _drop_active_box()


func _drop_active_box():
    if active_box != null:
        active_box.drop(active_box.position.snapped(Vector2(25, 25)))
        active_box = null



func _connect_boxes_signals():
    for box in get_tree().get_nodes_in_group("boxes"):
        
        if box is Box:
            box = box as Box
            box.picked.connect(_on_box_picked)


func _on_box_picked(box: Box) -> void:
    active_box = box



func _on_win_area_body_entered(body:Node2D):
    if body.is_in_group("red"):
        _end_puzzle()


func _end_puzzle():
    _drop_active_box()
    set_process_unhandled_input(false)
    _end_scene()


func _on_help_me_pressed():
    rage_piece.destroy()
    rect.visible = false
    # help_me_button.visible = false


func _on_help_timer_timeout():
    rect.visible = true
    # help_me_button.visible = true
    label1.visible = false
    label2.visible = true
