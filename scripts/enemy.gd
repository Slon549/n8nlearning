```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0
@onready var player = get_parent().get_node("Player") # 플레이어 노드 경로 수정 필요

var is_player_in_range: bool = false

func _physics_process(delta: float) -> void:
    is_player_in_range = (global_position.distance_to(player.global_position) <= detection_range)
    
    if is_player_in_range:
        move_towards_player(delta)

func move_towards_player(delta: float) -> void:
    var direction = (player.global_position - global_position).normalized()
    move_and_slide(direction * speed)
    
    if global_position.distance_to(player.global_position) <= attack_range:
        attack_player()

func attack_player() -> void:
    # 공격 로직 구현
    print("Attack!")
```