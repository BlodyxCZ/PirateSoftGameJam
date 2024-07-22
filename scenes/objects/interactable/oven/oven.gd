extends InteractableObject3D


func _on_body_entered(body: Player) -> void:
	super._on_body_entered(body)
	
	if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Place item")


func _on_body_exited(body: Player) -> void:
	super._on_body_exited(body)
	
	if body.held_item: Overlay.remove_action_by_text("Place item")


func _input(event: InputEvent) -> void:
	super._input(event)
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		if get_tree().get_first_node_in_group("Player").held_item:
			current_item = get_tree().get_first_node_in_group("Player").held_item
			get_tree().get_first_node_in_group("Player").held_item = null
			Overlay.remove_action_by_text("Place item")
