class_name Camera
extends Camera2D


@export var speed := 60.0


var switching_room := false
var target_room: Node2D = null


func _ready() -> void:
    Global.room_switch.connect(_on_room_switch)


func _process(delta: float) -> void:
    if not switching_room:
        return
    
    if target_room.position.x > position.x:
        position.x = minf(position.x + speed * delta, target_room.position.x)
    elif target_room.position.x < position.x:
        position.x = maxf(position.x - speed * delta, target_room.position.x)
    else:
        switching_room = false

func _on_room_switch(room: Node2D) -> void:
    switching_room = true
    target_room = room