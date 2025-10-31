class_name GrabbedPart
extends Sprite2D


var body_part_kind: BirdBox.BodyPart


func _process(delta: float) -> void:
    position = get_viewport().get_mouse_position()