```gdscript
extends Node2D

@export var speed: float = 200.0
@export var detection_range: float = 300.0

var player: Node2D

func _ready():
    player = get_node("/root/Player")  # 플레이어 노드 경로를 수정하세요

func _process(delta):
    if is_player_in_range():
        move_towards_player(delta)

func is_player_in_range() -> bool:
    return position.distance_to(player.position) <= detection_range

func move_towards_player(delta):
    var direction = (player.position - position).normalized()
    position += direction * speed * delta
```