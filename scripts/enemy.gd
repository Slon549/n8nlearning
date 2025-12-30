```gdscript
# Enemy.gd
extends CharacterBody3D

@export var speed : float = 2.0
@onready var player = null

func _ready():
    player = get_parent().get_node("Player") # 플레이어 노드 경로에 맞게 수정

func _process(delta):
    if player:
        var direction = (player.position - position).normalized()
        velocity = direction * speed
        move_and_slide()
```