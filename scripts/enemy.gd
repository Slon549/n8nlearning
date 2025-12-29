```gdscript
extends CharacterBody3D

@export var speed: float = 4.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0
@onready var player = get_parent().get_node("Player")

var is_chasing: bool = false

func _process(delta: float) -> void:
    if is_chasing:
        chase_player(delta)
    else:
        detect_player()

func detect_player() -> void:
    var distance_to_player = global_transform.origin.distance_to(player.global_transform.origin)
    if distance_to_player <= detection_range:
        is_chasing = true

func chase_player(delta: float) -> void:
    var direction = (player.global_transform.origin - global_transform.origin).normalized()
    if global_transform.origin.distance_to(player.global_transform.origin) > attack_range:
        move_and_slide(direction * speed)
    else:
        attack_player()

func attack_player() -> void:
    # 공격 로직을 여기에 추가
    print("공격!")
```