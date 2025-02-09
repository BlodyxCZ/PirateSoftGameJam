extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item and (current_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0)):
		Overlay.add_action(Action.BUTTONS.E, "Swap items")
	else:
		if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Place item")
		if current_item: Overlay.add_action(Action.BUTTONS.Q, "Chop item")
		if current_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0): Overlay.add_action(Action.BUTTONS.E, "Take item")

func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Place item")
	Overlay.remove_action_by_text("Swap items")
	Overlay.remove_action_by_text("Chop item")
	Overlay.remove_action_by_text("Take item")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action_pressed("interact1"):
		if player.held_item and ($PopUpTexture.process <= 1.0 or $PopUpTexture.process >= 100.0):
			current_item = player.held_item
			player.held_item = null
			_on_body_exited(player)
			_on_body_entered(player)
		elif current_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0):
			player.held_item = current_item
			current_item = null
			$Popup.end_process()
			_on_body_exited(player)
			_on_body_entered(player)
	if event.is_action_pressed("interact2") and current_item:
		if current_item:
			$Popup.step_process(10.0, 0.1)
		if $PopUpTexture.process >= 90.0:
			current_item.chop()
		if $PopUpTexture.process >= 188.0:
			current_item.trash()
		_on_body_exited(player)
		_on_body_entered(player)
