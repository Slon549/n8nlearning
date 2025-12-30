```gdscript
extends CharacterBody3D

@export var speed: float = 4.0
@export var detection_range: float = 10.0
@export var attack_range: float = 1.5

var target: Node3D = null

func _process(delta: float) -> void:
    if target:
        var distance_to_target = global_position.distance_to(target.global_position)
        
        if distance_to_target < attack_range:
            attack()
        elif distance_to_target < detection_range:
            chase_target(delta)

func chase_target(delta: float) -> void:
    var direction = (target.global_position - global_position).normalized()
    move_and_slide(direction * speed)

func attack() -> void:
    print("Attack!")
    
func _on_Area3D_body_entered(body: Node) -> void:
    if body.is_in_group("players"):
        target = body

func _on_Area3D_body_exited(body: Node) -> void:
    if body == target:
        target = null
```