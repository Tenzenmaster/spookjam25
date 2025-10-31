extends Node


const CURSOR_ARROW_LEFT := preload("res://sprites/arrow turn tiny tiny.png")
const CURSOR_ARROW_RIGHT := preload("res://sprites/arrow turn tiny tiny flipped.png")
const CURSOR_ARROW := preload("res://sprites/cursor tiny tiny.png")
const CURSOR_GRAB := preload("res://sprites/cursor click tiny tiny.png")


signal room_switch(from_room: Node2D, target_room: Node2D)


var game: Game = null


func _enter_tree() -> void:
    Input.set_custom_mouse_cursor(CURSOR_ARROW)


func _input(event: InputEvent) -> void:
    if event.is_action_pressed(&"ui_cancel"):
        get_tree().quit()