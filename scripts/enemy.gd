```gdscript
extends CharacterBody2D

@export var speed = 100.0
@export var detection_range = 200.0

var player: Node2D
var direction: Vector2

func _ready() -> void:
    player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if is_player_in_range():
        direction = (player.position - position).normalized()
        move_and_slide(direction * speed)

func is_player_in_range() -> bool:
    return position.distance_to(player.position) <= detection_range
```