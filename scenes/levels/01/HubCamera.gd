extends Camera3D


@export var follow_factor: float = 0.01

@onready var player: Player = get_tree().get_first_node_in_group("Player")


func _process(_delta: float) -> void:
	global_position.x = lerp(global_position.x, player.global_position.x, follow_factor)
