class_name BirdBox
extends InteractArea


const BODY_PART_DICT: Dictionary[BodyPart, CompressedTexture2D] = {
    BodyPart.HEAD1: preload("res://sprites/assets bird head 1.png"),
    BodyPart.HEAD2: preload("res://sprites/assets bird head 2.png"),
    BodyPart.BODY1: preload("res://sprites/assets bird body 1.png"),
    BodyPart.BODY2: preload("res://sprites/assets bird body 2.png"),
    BodyPart.WING1: preload("res://sprites/assets bird wing 1.png"),
    BodyPart.WING2: preload("res://sprites/assets bird wing 2.png"),
    BodyPart.TAIL1: preload("res://sprites/assets bird tail 1.png"),
    BodyPart.TAIL2: preload("res://sprites/assets bird tail 2.png"),
}


enum BodyPart {
    HEAD1,
    HEAD2,
    BODY1,
    BODY2,
    WING1,
    WING2,
    TAIL1,
    TAIL2,
}


@export var body_part: BodyPart = BodyPart.HEAD1


func _on_click() -> void:
    Global.game.pick_up_part(body_part)
