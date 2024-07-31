extends InteractableObject3D


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	
	if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Insert item")
	if current_item: Overlay.add_action(Action.BUTTONS.Q, "Open GUI")


func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Insert item")
	Overlay.remove_action_by_text("Open GUI")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action_pressed("interact1") and not gui.visible:
		current_item = player.held_item
		player.held_item = null
		Overlay.delete_order(current_item.order_id)
		_on_body_exited(player)
		_on_body_entered(player)
	if event.is_action_pressed("interact2") and current_item:
		gui.open()
