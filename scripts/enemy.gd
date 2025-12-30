```gdscript
extends CharacterBody3D

@export var speed : float = 5.0
@export var detection_radius : float = 10.0
@export var attack_radius : float = 2.0

var target : Node = null

func _process(delta: float) -> void:
    if target == null:
        target = get_tree().get_root().get_child(0)  # 타겟 노드를 설정하세요 (여기서는 첫 번째 자식으로 설정)
        
    var distance_to_target = global_position.distance_to(target.global_position)
    
    if distance_to_target < detection_radius:
        look_at(target.global_position, Vector3.UP)
        
        if distance_to_target > attack_radius:
            move_toward_target(delta)
        else:
            attack()
            
func move_toward_target(delta: float) -> void:
    var direction = (target.global_position - global_position).normalized()
    move_and_slide(direction * speed)

func attack() -> void:
    print("Attack!")
```