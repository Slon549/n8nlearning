```gdscript
extends Node2D

@export var speed: float = 200.0
@export var chase_distance: float = 300.0

var player: Node2D

func _ready():
    player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if player.position.distance_to(position) < chase_distance:
        var direction = (player.position - position).normalized()
        position += direction * speed * delta
```