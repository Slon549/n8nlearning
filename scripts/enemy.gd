```gdscript
extends Node2D

@export var speed := 200
@onready var player = get_parent().get_node("Player")

func _process(delta):
    if player:
        var direction = (player.position - position).normalized()
        position += direction * speed * delta
```