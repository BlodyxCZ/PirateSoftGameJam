extends ObjectGUI


const CARROT_ITEM = preload("res://scenes/classes/Item/Items/Carrot/CarrotItem.tres")


func open() -> void:
	super.open()
	$Panel/MarginContainer/GridContainer/Carrot.grab_focus()


func _on_carrot_pressed() -> void:
	player.held_item = CARROT_ITEM
	close()
