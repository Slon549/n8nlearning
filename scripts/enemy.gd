```gdscript
extends CharacterBody3D

@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0
@export var player: Node3D

var is_player_in_range: bool = false

func _ready():
    if player == null:
        player = get_parent().get_node("Player")

func _process(delta):
    is_player_in_range = is_instance_valid(player) and global_position.distance_to(player.global_position) < detection_range
    
    if is_player_in_range:
        move_towards_player(delta)

func move_towards_player(delta):
    var direction = (player.global_position - global_position).normalized()
    velocity.x = direction.x * speed
    velocity.z = direction.z * speed
    
    if global_position.distance_to(player.global_position) < attack_range:
        attack_player()
    else:
        move_and_slide()
        
func attack_player():
    # 공격 로직을 여기에 추가합니다.
    print("Attacking player!")
```