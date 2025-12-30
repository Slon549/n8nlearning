```gdscript
extends CharacterBody3D

@export var speed : float = 3.0
@export var detection_range : float = 10.0
@export var attack_range : float = 1.5

var player : Node3D = null

func _ready():
    player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if player and position.distance_to(player.position) <= detection_range:
        move_towards_player(delta)

func move_towards_player(delta: float) -> void:
    var direction = (player.position - position).normalized()
    if position.distance_to(player.position) > attack_range:
        move_and_slide(direction * speed)
```