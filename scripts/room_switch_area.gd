class_name RoomSwitchArea
extends Area2D


@export var is_right := false
@export var target_room: Node2D


func _ready() -> void:
    mouse_entered.connect(_on_mouse_entered)
    mouse_exited.connect(_on_mouse_exited)
    input_event.connect(_on_input_event)


func _on_mouse_entered() -> void:
    print(name + ": mouse entered")
    if is_right:
        Input.set_custom_mouse_cursor(Global.CURSOR_ARROW_RIGHT)
    else:
        Input.set_custom_mouse_cursor(Global.CURSOR_ARROW_LEFT)


func _on_mouse_exited() -> void:
    print(name + ": mouse exited")
    Input.set_custom_mouse_cursor(null)


func _on_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
    if event.is_action_pressed(&"interact"):
        Global.room_switch.emit(target_room)