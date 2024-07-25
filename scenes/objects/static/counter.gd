extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Place item")
	if current_item: Overlay.add_action(Action.BUTTONS.E, "Take item")

func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	if body.held_item: Overlay.remove_action_by_text("Place item")
	if current_item: Overlay.remove_action_by_text("Take item")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		if player.held_item:
			var tmp = current_item
			current_item = player.held_item
			player.held_item = tmp
			Overlay.remove_action_by_text("Place item")
			Overlay.add_action(Action.BUTTONS.E, "Take item")
		elif current_item:
			var tmp = player.held_item
			player.held_item = current_item
			current_item = tmp
			Overlay.add_action(Action.BUTTONS.E, "Place item")
			Overlay.remove_action_by_text("Take item")
