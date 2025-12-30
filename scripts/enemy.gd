```gdscript
extends CharacterBody3D

@export var speed: float = 4.0
@export var detection_radius: float = 10.0
@export var attack_radius: float = 2.0

var player: Node3D = null
var is_chasing: bool = false

func _ready():
    player = get_parent().get_node("Player")  # 플레이어 노드의 경로를 설정하세요.

func _process(delta: float) -> void:
    if player:
        var distance_to_player = global_transform.origin.distance_to(player.global_transform.origin)
        if distance_to_player < detection_radius:
            is_chasing = true
        else:
            is_chasing = false

        if is_chasing:
            chase_player(delta, distance_to_player)

func chase_player(delta: float, distance_to_player: float) -> void:
    var direction = (player.global_transform.origin - global_transform.origin).normalized()
    if distance_to_player > attack_radius:
        move_and_slide(direction * speed)
    else:
        attack_player()

func attack_player() -> void:
    print("Player attacked!")
```