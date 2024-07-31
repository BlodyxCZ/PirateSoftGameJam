extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Trash item")


func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Trash item")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action_pressed("interact1"):
		if player.held_item:
			player.held_item.trash()
			player.held_item = null
		_on_body_exited(player)
		_on_body_entered(player)
