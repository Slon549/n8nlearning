```gdscript
extends CharacterBody3D

@export var speed: float = 3.0
@export var detection_range: float = 10.0
var target: Node3D

func _process(delta: float) -> void:
    if target:
        var direction = (target.global_position - global_position).normalized()
        if global_position.distance_to(target.global_position) <= detection_range:
            move_and_slide(direction * speed)

func _on_Area3D_body_entered(body: Node) -> void:
    if body.is_in_group("players"):
        target = body

func _on_Area3D_body_exited(body: Node) -> void:
    if body.is_in_group("players") and target == body:
        target = null
```