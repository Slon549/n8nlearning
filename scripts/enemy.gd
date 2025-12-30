```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0
@onready var player = get_parent().get_node("Player")

var direction = Vector3.ZERO

func _process(delta: float) -> void:
    if is_player_in_range():
        direction = (player.global_transform.origin - global_transform.origin).normalized()
        move_and_slide(direction * speed)
        if is_player_in_attack_range():
            attack_player()

func is_player_in_range() -> bool:
    return global_transform.origin.distance_to(player.global_transform.origin) <= detection_range

func is_player_in_attack_range() -> bool:
    return global_transform.origin.distance_to(player.global_transform.origin) <= attack_range

func attack_player() -> void:
    print("Attack!")
```