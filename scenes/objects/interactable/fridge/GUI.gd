extends ObjectGUI


const CARROT_ITEM = preload("res://scenes/classes/Item/Items/Carrot.tres")
const PEPPER_ITEM = preload("res://scenes/classes/Item/Items/BellPeppers.tres")
const CHICKEN_ITEM = preload("res://scenes/classes/Item/Items/Chicken.tres")


func open() -> void:
	super.open()
	$Panel/MarginContainer/GridContainer/Carrot.grab_focus()


func _ready() -> void:
	var carrot = CARROT_ITEM
	var pepper = PEPPER_ITEM
	var chicken = CHICKEN_ITEM


func _on_carrot_pressed() -> void:
	player.held_item = CARROT_ITEM
	close()


func _on_pepper_pressed() -> void:
	player.held_item = PEPPER_ITEM
	close()


func _on_chicken_pressed() -> void:
	player.held_item = CHICKEN_ITEM
	close()
