class_name InteractArea
extends Area2D


func _ready() -> void:
    mouse_entered.connect(_on_mouse_entered)
    mouse_exited.connect(_on_mouse_exited)
    input_event.connect(_on_input_event)


func _on_mouse_entered() -> void:
    Input.set_custom_mouse_cursor(Global.CURSOR_GRAB)


func _on_mouse_exited() -> void:
    Input.set_custom_mouse_cursor(Global.CURSOR_ARROW)


func _on_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
    if event.is_action_pressed(&"interact"):
        _on_click()


func _on_click() -> void:
    pass