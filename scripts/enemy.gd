```gdscript
extends Node2D

@export var speed: float = 200.0
@onready var player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if player:
        var direction = (player.position - position).normalized()
        position += direction * speed * delta
```