class_name Game
extends Node2D


@onready var current_room: Node2D = $Front
@onready var camera: Camera = $Camera
@onready var ui: CanvasLayer = $UI


var grabbed_part: GrabbedPart = null


func _enter_tree() -> void:
	Global.game = self


func _ready() -> void:
	Global.room_switch.connect(_on_room_switch)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"deselect"):
		put_down_part()


func switch_room(target_room: Node2D, is_edge := false, is_right := false) -> void:
	print("switching room")
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

	var texture := GrabbedPart.new()
	texture.texture = BirdBox.BODY_PART_DICT[part]
	texture.body_part_kind = part
	ui.add_child(texture)
	grabbed_part = texture


func put_down_part() -> void:
	if grabbed_part:
		grabbed_part.queue_free()
		grabbed_part = null
