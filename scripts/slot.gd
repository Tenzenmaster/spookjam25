class_name Slot
extends TextureRect


@onready var item: TextureRect = $Item


var part: BirdBox.BodyPart


func _ready() -> void:
    gui_input.connect(_on_gui_input)


func _on_gui_input(event: InputEvent) -> void:
    if event.is_action_pressed(&"interact"):
        if Global.game.grabbed_part:
            add_item(Global.game.grabbed_part.body_part_kind)
            Global.game.put_down_part()
        elif not is_empty():
            take_out_item()


func add_item(body_part_kind: BirdBox.BodyPart) -> void:
    part = body_part_kind
    item.texture = BirdBox.BODY_PART_DICT[body_part_kind]
    item.show()


func remove_item() -> void:
    item.hide()


func take_out_item() -> bool:
    if is_empty():
        return false

    Global.game.pick_up_part(part)
    remove_item()
    
    return true

func is_empty() -> bool:
    return not item.visible