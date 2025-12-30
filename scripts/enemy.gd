```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 1.5
@onready var player = $Player

var is_player_detected: bool = false

func _process(delta: float) -> void:
    var distance_to_player = global_position.distance_to(player.global_position)
    
    if distance_to_player <= detection_range:
        is_player_detected = true
        look_at(player.global_position, Vector3.UP)
        move_towards_player(delta)
    else:
        is_player_detected = false

func move_towards_player(delta: float) -> void:
    if global_position.distance_to(player.global_position) > attack_range:
        var direction = (player.global_position - global_position).normalized()
        move_and_slide(direction * speed)

func _on_attack_area_body_entered(body: Node) -> void:
    if body.is_in_group("players"):
        body.take_damage(1)  # 해당하는 데미지 처리
```