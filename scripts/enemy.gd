```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var target: Node3D
var is_chasing: bool = false

func _process(delta: float) -> void:
    if target:
        var distance_to_target = global_position.distance_to(target.global_position)
        if distance_to_target <= detection_range:
            is_chasing = true
        else:
            is_chasing = false
        
        if is_chasing:
            chase_target(delta)

func chase_target(delta: float) -> void:
    var direction = (target.global_position - global_position).normalized()
    move_and_slide(direction * speed)
```