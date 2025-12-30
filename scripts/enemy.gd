```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0
@onready var player = get_node("../Player")

var is_chasing: bool = false

func _process(delta: float) -> void:
    var distance_to_player = global_transform.origin.distance_to(player.global_transform.origin)
    
    if distance_to_player < detection_range:
        is_chasing = true
    
    if is_chasing:
        if distance_to_player > attack_range:
            chase_player(delta)
        else:
            attack_player()

func chase_player(delta: float) -> void:
    var direction = (player.global_transform.origin - global_transform.origin).normalized()
    move_and_slide(direction * speed)

func attack_player() -> void:
    print("Attacking the player!")
```