extends Node


const CURSOR_ARROW_LEFT := preload("res://sprites/arrow turn tiny.png")
const CURSOR_ARROW_RIGHT := preload("res://sprites/arrow turn tiny flipped.png")
const CURSOR_ARROW := preload("res://sprites/cursor tiny.png")


signal room_switch(from_room: Node2D, target_room: Node2D)


var game: Game = null


func _enter_tree() -> void:
    Input.set_custom_mouse_cursor(CURSOR_ARROW)