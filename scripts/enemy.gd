```gdscript
extends CharacterBody3D

var target : Node = null
var speed : float = 5.0
var chase_range : float = 10.0

func _ready() -> void:
    target = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if target:
        var distance = global_transform.origin.distance_to(target.global_transform.origin)
        if distance <= chase_range:
            chase_player(delta)

func chase_player(delta: float) -> void:
    var direction = (target.global_transform.origin - global_transform.origin).normalized()
    move_and_slide(direction * speed)

func _on_Area3D_body_entered(body: Node) -> void:
    if body.name == "Player":
        target = body

func _on_Area3D_body_exited(body: Node) -> void:
    if body == target:
        target = null
```