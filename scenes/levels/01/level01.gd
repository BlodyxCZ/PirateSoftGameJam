extends Node3D


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("XXX"):
		SceneTransition.current_transition = SceneTransition.TYPE.fade_in_out
		SceneTransition.start_transition(2.0, "res://scenes/TEST/node_2d.tscn")
