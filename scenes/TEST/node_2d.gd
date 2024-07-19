extends Node3D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("XXX"):
		SceneTransition.current_transition = SceneTransition.TYPE.fade_in_out
		SceneTransition.start_transition(2.0, "res://scenes/objects/interactable/oven/oven.tscn")
