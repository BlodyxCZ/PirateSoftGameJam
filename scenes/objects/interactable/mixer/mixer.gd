extends InteractableObject3D


var items: Array[Item] = []


func _on_body_entered(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_entered(body)
	

	if body.held_item: Overlay.add_action(Action.BUTTONS.E, "Place item")
	if items.size() >= 3: Overlay.add_action(Action.BUTTONS.Q, "Mix items")
	elif items.size() > 0: Overlay.add_action(Action.BUTTONS.Q, "Dump items")



func _on_body_exited(body: Node3D) -> void:
	if not body is Player: return
	super._on_body_exited(body)
	
	Overlay.remove_action_by_text("Place item")
	Overlay.remove_action_by_text("Mix items")
	Overlay.remove_action_by_text("Dump items")


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action_pressed("interact1") and not gui.visible and items.size() < 3:
		if player.held_item:
			items.append(player.held_item)
			Overlay.delete_order(player.held_item.order_id)
			player.held_item = null
			_on_body_exited(player)
			_on_body_entered(player)
	elif event.is_action_pressed("interact1") and not gui.visible and items.size() >= 3:
		items.clear()
		_on_body_exited(player)
		_on_body_entered(player)
	if event.is_action_pressed("interact2") and items.size() >= 3:
		for item in items:
			match item.item_name:
				"Banana":
					pass
				"Coconut":
					pass
				"SoyCream":
					pass
				_:
					item.trash()
					player.held_item = item
					items.clear()
					return
		for item in items:
			if item.item_name == "Banana":
				item.mix()
				player.held_item = item
				items.clear()
				return
	elif event.is_action_pressed("interact2") and items.size() < 3:
		items.clear()
