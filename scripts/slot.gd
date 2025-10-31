class_name Slot
extends TextureRect


@onready var margin_container: MarginContainer = $MarginContainer


var body_part: TextureRect


func _ready() -> void:
    gui_input.connect(_on_gui_input)


func _on_gui_input(event: InputEvent) -> void:
    if event.is_action_pressed(&"interact") and Global.game.grabbed_part:
        print("meow")
        add_item(Global.game.grabbed_part.body_part_kind)
        Global.game.put_down_part()


func add_item(body_part_kind: BirdBox.BodyPart) -> void:
    if body_part:
        body_part.queue_free()
    
    var tex := TextureRect.new()
    tex.texture = BirdBox.BODY_PART_DICT[body_part_kind]
    margin_container.add_child(tex)
    tex.scale = Vector2(0.5, 0.5)
