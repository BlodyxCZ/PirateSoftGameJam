extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item and current_item:
		Overlay.add_action(Action.BUTTONS.E, "Swap items")
		Overlay.add_action(Action.BUTTONS.Q, "Combine")
	else:
		if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Place item")
		if current_item: Overlay.add_action(Action.BUTTONS.E, "Take item")


func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Swap items")
	Overlay.remove_action_by_text("Combine")
	Overlay.remove_action_by_text("Place item")
	Overlay.remove_action_by_text("Take item")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		if player.held_item and current_item:
			pass
		elif player.held_item:
			Overlay.remove_action_by_text("Place item")
			Overlay.add_action(Action.BUTTONS.E, "Take item")
		elif current_item:
			Overlay.add_action(Action.BUTTONS.E, "Place item")
			Overlay.remove_action_by_text("Take item")
		var tmp = player.held_item
		player.held_item = current_item
		current_item = tmp
	if event.is_action("interact2") and event.is_pressed() and not event.is_echo():
		if current_item.combined:
			if current_item.combine(player.held_item):
				current_item = current_item
				player.held_item = null
				Overlay.add_action(Action.BUTTONS.E, "Take item")
		elif player.held_item.combined:
			if player.held_item.combine(current_item):
				player.held_item = player.held_item
				current_item = null
				Overlay.add_action(Action.BUTTONS.E, "Place item")
		Overlay.remove_action_by_text("Swap items")
		Overlay.remove_action_by_text("Combine")
