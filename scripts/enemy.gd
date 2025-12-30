```gdscript
extends CharacterBody3D

@export var speed: float = 3.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0
@onready var player = get_parent().get_node("Player")

var is_chasing: bool = false

func _process(delta: float) -> void:
    var distance_to_player = global_position.distance_to(player.global_position)

    if distance_to_player < detection_range:
        is_chasing = true
    else:
        is_chasing = false

    if is_chasing:
        chase_player(delta)

func chase_player(delta: float) -> void:
    var direction = (player.global_position - global_position).normalized()
    move_and_slide(direction * speed)

    if global_position.distance_to(player.global_position) < attack_range:
        attack_player()

func attack_player() -> void:
    # 공격 로직 추가
    print("Attack the player!")
```