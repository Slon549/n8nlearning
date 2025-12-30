```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_radius: float = 10.0
@export var attack_radius: float = 2.0
@export var player: Node3D

var target: Node3D = null

func _ready():
    pass

func _process(delta: float) -> void:
    if target == null:
        detect_player()
    else:
        chase_player(delta)

func detect_player() -> void:
    if player.global_transform.origin.distance_to(global_transform.origin) <= detection_radius:
        target = player

func chase_player(delta: float) -> void:
    var direction = (target.global_transform.origin - global_transform.origin).normalized()
    if direction.length() > attack_radius:
        move_and_slide(direction * speed)
    else:
        attack_player()

func attack_player() -> void:
    print("Attacking player!")
```
