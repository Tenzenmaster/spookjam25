class_name Game
extends Node2D


@onready var current_room: Node2D = $Rooms/Front
@onready var camera: Camera = $Camera
@onready var ui: CanvasLayer = $UI
@onready var music_player: AudioStreamPlayer = $MusicPlayer


var grabbed_part: Node2D = null
var grabbed_part_kind := BirdBox.BodyPart.NONE


func _enter_tree() -> void:
	Global.game = self


func _ready() -> void:
	Global.room_switch.connect(_on_room_switch)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"deselect"):
		put_down_part()


func _process(delta: float) -> void:
	if grabbed_part:
		grabbed_part.position = get_viewport().get_mouse_position()


func switch_room(target_room: Node2D, is_edge := false, is_right := false) -> void:
	var original_position := current_room.position
	if is_edge:
		var new_starting_x := target_room.position.x + (-1920.0 if is_right else 1920.0)
		current_room.position.x = new_starting_x
		camera.position.x = new_starting_x

	camera.switch_room(target_room)
	await camera.finished_moving
	
	if is_edge:
		current_room.position = original_position

	current_room = target_room


func _on_room_switch(room: Node2D) -> void:
	current_room = room


func pick_up_part(part: BirdBox.BodyPart) -> void:
	if grabbed_part:
		put_down_part()

	var texture := Sprite2D.new()
	texture.texture = BirdBox.BODY_PART_DICT[part]
	ui.add_child(texture)
	grabbed_part = texture
	grabbed_part_kind = part


func pick_up_node(node: Node2D, kind: BirdBox.BodyPart) -> void:
	if grabbed_part:
		put_down_part()

	ui.add_child(node)
	grabbed_part = node
	grabbed_part_kind = kind


func put_down_part() -> void:
	if grabbed_part:
		grabbed_part.queue_free()
		grabbed_part = null
		grabbed_part_kind = BirdBox.BodyPart.NONE


func relinquish_part() -> Node2D:
	if grabbed_part:
		var part := grabbed_part
		ui.remove_child(grabbed_part)
		grabbed_part = null
		grabbed_part_kind = BirdBox.BodyPart.NONE
		return part
	return null
