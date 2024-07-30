extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item and (current_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0)):
		Overlay.add_action(Action.BUTTONS.E, "Swap items")
	else:
		if body.held_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0): Overlay.add_action(Action.BUTTONS.E, "Place item")
		if current_item and $PopUpTexture.process == 0.0: Overlay.add_action(Action.BUTTONS.Q, "Start processing")
		if current_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0): Overlay.add_action(Action.BUTTONS.E, "Take item")

func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Swap items")
	Overlay.remove_action_by_text("Start processing")
	Overlay.remove_action_by_text("Place item")
	Overlay.remove_action_by_text("Take item")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action_pressed("interact1"):
		if player.held_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0):
			var tmp = current_item
			current_item = player.held_item
			player.held_item = tmp
			$PopUpTexture.reset()
			$Popup.end_process()
			_on_body_exited(player)
			_on_body_entered(player)
		elif current_item and ($PopUpTexture.process <= 0.0 or $PopUpTexture.process >= 100.0):
			var tmp = current_item
			current_item = player.held_item
			player.held_item = tmp
			$PopUpTexture.reset()
			$Popup.end_process()
			_on_body_exited(player)
			_on_body_entered(player)
	if event.is_action("interact2") and event.is_pressed() and not event.is_echo():
		if current_item and $PopUpTexture.process == 0.0:
			Overlay.remove_action_by_text("Start processing")
			Overlay.remove_action_by_text("Take item")
			$PopUpTexture.reset()
			$Popup.process(10.0, 6.0)


func _on_popup_process_complete() -> void:
	current_item.cook()
	
	if is_in_range:
		if current_item and $PopUpTexture.process >= 100.0: Overlay.add_action(Action.BUTTONS.E, "Take item")


func _on_popup_overprocess_complete() -> void:
	current_item.trash()
