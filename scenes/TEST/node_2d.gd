extends Node3D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("XXX"):
		SceneTransition.current_transition = SceneTransition.TYPE.swipe_right
		SceneTransition.start_transition(2.0, "res://scenes/TEST/node_2d.tscn")
