extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	Overlay.add_action(Action.BUTTONS.Q, "Open")


func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Open")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") and is_in_range:
		if not gui.visible:
			gui.open()
		else:
			gui.close()
