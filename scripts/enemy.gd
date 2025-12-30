```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@onready var player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    var distance_to_player = global_position.distance_to(player.global_position)
    if distance_to_player <= detection_range:
        var direction = (player.global_position - global_position).normalized()
        move_and_slide(direction * speed)

        look_at(player.global_position, Vector3.UP)
```