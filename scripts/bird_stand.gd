class_name BirdStand
extends InteractArea


@onready var parts: Node2D = $Parts
@onready var head_sprite: Sprite2D = $Parts/Head
@onready var body_sprite: Sprite2D = $Parts/Body
@onready var wing_sprite: Sprite2D = $Parts/Wing
@onready var tail_sprite: Sprite2D = $Parts/Tail


var head_kind := BirdBox.BodyPart.NONE
var body_kind := BirdBox.BodyPart.NONE
var wing_kind := BirdBox.BodyPart.NONE
var tail_kind := BirdBox.BodyPart.NONE


func _ready() -> void:
	super()
	head_sprite.hide()
	body_sprite.hide()
	wing_sprite.hide()
	tail_sprite.hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"debug_a"):
		finish_bird()


func _on_click() -> void:
	if Global.game.grabbed_part:
		var part := Global.game.grabbed_part_kind
		add_part(part)


func add_part(part: BirdBox.BodyPart) -> void:
	Global.game.put_down_part()
	match part:
		BirdBox.BodyPart.HEAD1, BirdBox.BodyPart.HEAD2:
			head_sprite.show()
			head_sprite.texture = BirdBox.BODY_PART_DICT[part]
			head_kind = part
		BirdBox.BodyPart.BODY1, BirdBox.BodyPart.BODY2:
			body_sprite.show()
			body_sprite.texture = BirdBox.BODY_PART_DICT[part]
			body_kind = part
		BirdBox.BodyPart.WING1, BirdBox.BodyPart.WING2:
			wing_sprite.show()
			wing_sprite.texture = BirdBox.BODY_PART_DICT[part]
			wing_kind = part
		BirdBox.BodyPart.TAIL1, BirdBox.BodyPart.TAIL2:
			tail_sprite.show()
			tail_sprite.texture = BirdBox.BODY_PART_DICT[part]
			tail_kind = part
		BirdBox.BodyPart.NONE:
			push_error("cannot add BodyPart.NONE to bird stand")


func is_bird_finished() -> bool:
	return (head_kind != BirdBox.BodyPart.NONE)\
		and (body_kind != BirdBox.BodyPart.NONE)\
		and (wing_kind != BirdBox.BodyPart.NONE)\
		and (tail_kind != BirdBox.BodyPart.NONE)


func finish_bird() -> void:
	if not is_bird_finished():
		return
	
	remove_child(parts)
	Global.game.pick_up_node(parts, BirdBox.BodyPart.FULL)
	parts = null
