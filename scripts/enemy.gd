```gdscript
extends CharacterBody2D

@export var speed: float = 100.0
@export var detection_range: float = 200.0
@export var attack_range: float = 50.0

var player: Node2D

func _ready() -> void:
    player = get_parent().get_node("Player")

func _process(delta: float) -> void:
    if player:
        var distance_to_player = position.distance_to(player.position)
        
        if distance_to_player < detection_range:
            if distance_to_player > attack_range:
                move_towards_player(delta)
            else:
                attack_player()

func move_towards_player(delta: float) -> void:
    var direction = (player.position - position).normalized()
    velocity = direction * speed
    move_and_slide(velocity)

func attack_player() -> void:
    # 공격 로직을 여기에 추가하세요.
    print("Attacking Player!")
```