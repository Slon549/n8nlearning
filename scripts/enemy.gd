```gdscript
extends Enemy

@export var speed: float = 200.0
@export var detection_range: float = 300.0

var target: Node

func _ready():
    target = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if is_target_in_range():
        move_towards_target(delta)

func is_target_in_range() -> bool:
    return global_position.distance_to(target.global_position) < detection_range

func move_towards_target(delta: float) -> void:
    var direction = (target.global_position - global_position).normalized()
    global_position += direction * speed * delta
```