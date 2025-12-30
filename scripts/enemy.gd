```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 1.5

var target: Node3D

func _process(delta: float) -> void:
    if target:
        var distance = global_position.distance_to(target.global_position)
        
        if distance <= detection_range:
            look_at(target.global_position, Vector3.UP)
            if distance > attack_range:
                move_toward_target(delta)
            else:
                attack()

func move_toward_target(delta: float) -> void:
    var direction = (target.global_position - global_position).normalized()
    move_and_slide(direction * speed)

func attack() -> void:
    print("Attacking the player!")
    
func _on_Player_detected(new_target: Node3D) -> void:
    target = new_target

func _on_Player_exited() -> void:
    target = null
```