```gdscript
extends Node2D

# 노드 변수 선언
var player : Node2D
var speed : float = 100.0
var detection_range : float = 300.0

func _ready():
    player = get_parent().get_node("Player")

func _process(delta):
    var direction = player.position - position
    if direction.length() <= detection_range:
        direction = direction.normalized()
        position += direction * speed * delta
```