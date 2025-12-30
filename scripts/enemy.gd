```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var chase_distance: float = 10.0
@onready var player = get_parent().get_node("Player") # Replace with your player's node path

func _process(delta):
    var distance_to_player = global_transform.origin.distance_to(player.global_transform.origin)
    if distance_to_player < chase_distance:
        chase_player(delta)

func chase_player(delta: float):
    var direction = (player.global_transform.origin - global_transform.origin).normalized()
    move_and_slide(direction * speed)
```