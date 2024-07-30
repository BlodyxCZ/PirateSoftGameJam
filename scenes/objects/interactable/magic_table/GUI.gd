extends ObjectGUI


func open() -> void:
	super.open()
	if get_parent().get_parent().current_item:
		$Panel/Item.texture = get_parent().get_parent().current_item.texture
	else:
		$Panel/Item.texture = null


func _on_button_pressed() -> void:
	get_parent().get_parent().current_item.enchant()
	close()
