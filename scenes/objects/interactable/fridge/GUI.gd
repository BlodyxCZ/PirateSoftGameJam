extends ObjectGUI


const CARROT_ITEM = preload("res://scenes/classes/Item/Items/Vegetables.tres")
const PEPPER_ITEM = preload("res://scenes/classes/Item/Items/BellPeppers.tres")
const CHICKEN_ITEM = preload("res://scenes/classes/Item/Items/Chicken.tres")
const WINE_ITEM = preload("res://scenes/classes/Item/Items/Wine.tres")


func open() -> void:
	super.open()
	if not Global.controller == Global.controllers.PC:
		$Panel/MarginContainer/GridContainer/Carrot.grab_focus()


func _ready() -> void:
	super._ready()
	Item.new()


func _on_carrot_pressed() -> void:
	CARROT_ITEM.texture = CARROT_ITEM.default
	player.held_item = CARROT_ITEM.instantiate()
	close()


func _on_pepper_pressed() -> void:
	PEPPER_ITEM.texture = PEPPER_ITEM.default
	player.held_item = PEPPER_ITEM.instantiate()
	close()


func _on_chicken_pressed() -> void:
	CHICKEN_ITEM.texture = CHICKEN_ITEM.default
	player.held_item = CHICKEN_ITEM.instantiate()
	close()


func _on_wine_pressed() -> void:
	WINE_ITEM.texture = WINE_ITEM.default
	player.held_item = WINE_ITEM.instantiate()
	close()
