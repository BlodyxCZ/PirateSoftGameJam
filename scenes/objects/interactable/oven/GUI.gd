extends ObjectGUI


const CARROT_ITEM = preload("res://scenes/classes/Item/Items/Carrot/CarrotItem.tres")


func _on_carrot_pressed() -> void:
	player.held_item = CARROT_ITEM
