extends CanvasLayer


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()


func pause() -> void:
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_PAUSABLE
	get_tree().paused = !get_tree().paused
	$Pause.visible = get_tree().paused
