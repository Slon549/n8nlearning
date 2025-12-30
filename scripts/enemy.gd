```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0

var player: Node

func _ready():
    player = get_parent().get_node("Player")  # Replace with your player's node path

func _process(delta: float) -> void:
    if player:
        var direction = (player.global_transform.origin - global_transform.origin).normalized()
        var distance_to_player = global_transform.origin.distance_to(player.global_transform.origin)

        if distance_to_player <= detection_range:
            move_and_slide(direction * speed)

            if distance_to_player <= attack_range:
                attack_player()

func attack_player() -> void:
    # Implement attack logic here
    print("Attacking player!")
```