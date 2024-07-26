extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Place item")
	if current_item: Overlay.add_action(Action.BUTTONS.Q, "Open GUI")


func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Place item")
	Overlay.remove_action_by_text("Open GUI")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		if player.held_item:
			var tmp = player.held_item
			player.held_item = current_item
			current_item = tmp
		_on_body_exited(player)
		_on_body_entered(player)
	if event.is_action("interact2") and event.is_pressed() and not event.is_echo():
		gui.open()
