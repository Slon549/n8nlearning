```gdscript
extends Node2D

@export var speed: float = 200.0
@export var detection_range: float = 300.0
@export var attack_range: float = 50.0

var player: Node2D

func _ready():
    player = get_parent().get_node("Player")

func _process(delta: float):
    if player:
        var distance = global_position.distance_to(player.global_position)
        if distance < detection_range:
            if distance > attack_range:
                move_towards_player(delta)
            else:
                attack_player()

func move_towards_player(delta: float):
    var direction = (player.global_position - global_position).normalized()
    global_position += direction * speed * delta

func attack_player():
    print("Attacking the player!")
```