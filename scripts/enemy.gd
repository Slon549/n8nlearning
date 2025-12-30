```gdscript
extends CharacterBody2D

@export var speed: float = 100.0
 @export var detection_range: float = 300.0

var player: Node

func _ready():
    player = get_tree().get_root().get_node("Path/To/Player")

func _process(delta: float) -> void:
    if player and position.distance_to(player.position) < detection_range:
        move_towards_player(delta)

func move_towards_player(delta: float) -> void:
    var direction = (player.position - position).normalized()
    move_and_slide(direction * speed)
```