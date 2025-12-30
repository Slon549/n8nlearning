```gdscript
extends Node2D

@export var speed: float = 200.0
@export var detection_range: float = 300.0
@onready var player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if is_player_in_range():
        move_towards_player(delta)

func is_player_in_range() -> bool:
    return position.distance_to(player.position) <= detection_range

func move_towards_player(delta: float) -> void:
    var direction = (player.position - position).normalized()
    position += direction * speed * delta
```