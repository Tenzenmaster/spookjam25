class_name InteractArea
extends Area2D


func _ready() -> void:
    mouse_entered.connect(_on_mouse_entered)
    mouse_exited.connect(_on_mouse_exited)
    input_event.connect(_on_input_event)


func _on_mouse_entered() -> void:
    print(name + ": mouse entered")
    Input.set_default_cursor_shape(Input.CursorShape.CURSOR_POINTING_HAND)


func _on_mouse_exited() -> void:
    print(name + ": mouse exited")
    Input.set_default_cursor_shape(Input.CursorShape.CURSOR_ARROW)


func _on_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
    if event.is_action_pressed(&"interact"):
        print(name + ": interacted")
    elif event.is_action_released(&"interact"):
        print(name + ": released")