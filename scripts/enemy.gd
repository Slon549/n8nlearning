```gdscript
extends CharacterBody3D

@export var speed : float = 5.0
@export var detection_range : float = 10.0
@export var attack_range : float = 2.0
@onready var player = get_node("Path/To/Player")

var target_direction: Vector3

func _process(delta: float) -> void:
    if is_player_in_range():
        track_player(delta)
        
func is_player_in_range() -> bool:
    return position.distance_to(player.position) <= detection_range

func track_player(delta: float) -> void:
    target_direction = (player.position - position).normalized()
    if position.distance_to(player.position) > attack_range:
        move_and_slide(target_direction * speed)
    else:
        attack_player()

func attack_player() -> void:
    # 공격 로직을 여기 추가
    pass
```