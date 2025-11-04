class_name Slot
extends TextureRect


const CENTER := Vector2(62.0, 62.0)


var part_node: Node2D
var part: BirdBox.BodyPart


func _ready() -> void:
	gui_input.connect(_on_gui_input)


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"interact"):
		if Global.game.grabbed_part:
			#add_item(Global.game.grabbed_part_kind)
			#Global.game.put_down_part()
			var kind := Global.game.grabbed_part_kind
			var grabbed_part := Global.game.relinquish_part()
			add_item_node(grabbed_part, kind)
		elif not is_empty():
			take_out_item()


func add_item_node(node: Node2D, kind: BirdBox.BodyPart) -> void:
	add_child(node)
	node.position = CENTER
	node.scale = Vector2(0.5, 0.5)
	part_node = node
	part = kind


func remove_item() -> void:
	part_node.queue_free()
	part_node = null
	part = BirdBox.BodyPart.NONE


func take_out_item() -> void:
	if is_empty():
		return

	part_node.scale = Vector2(1.0, 1.0)
	remove_child(part_node)
	Global.game.pick_up_node(part_node, part)
	part_node = null
	part = BirdBox.BodyPart.NONE


func is_empty() -> bool:
	return part == BirdBox.BodyPart.NONE
