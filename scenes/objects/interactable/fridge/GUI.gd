extends ObjectGUI


const CARROT_ITEM = preload("res://scenes/classes/Item/Items/Vegetables.tres")
const PEPPER_ITEM = preload("res://scenes/classes/Item/Items/BellPeppers.tres")
const CHICKEN_ITEM = preload("res://scenes/classes/Item/Items/Chicken.tres")
const WINE_ITEM = preload("res://scenes/classes/Item/Items/Wine.tres")
const ONIONS_ITEM = preload("res://scenes/classes/Item/Items/Onions.tres")
const RICE_ITEM = preload("res://scenes/classes/Item/Items/Rice.tres")
const TOFU_ITEM = preload("res://scenes/classes/Item/Items/Tofu.tres")
const HOT_SAUCE_ITEM = preload("res://scenes/classes/Item/Items/HotSauce.tres")
const BANANA = preload("res://scenes/classes/Item/Items/Banana.tres")
const COCONUT = preload("res://scenes/classes/Item/Items/Coconut.tres")
const CRUST = preload("res://scenes/classes/Item/Items/Crust.tres")
const SOY_CREAM = preload("res://scenes/classes/Item/Items/SoyCream.tres")


func open() -> void:
	super.open()
	if not Global.controller == Global.controllers.PC:
		$CenterContainer/Panel/CenterContainer/GridContainer/Carrot.grab_focus()


func _ready() -> void:
	super._ready()
	Item.new()


func _on_carrot_pressed() -> void:
	CARROT_ITEM.texture = CARROT_ITEM.default
	if not player.held_item: player.held_item = CARROT_ITEM.instantiate()
	close()

func _on_pepper_pressed() -> void:
	PEPPER_ITEM.texture = PEPPER_ITEM.default
	if not player.held_item: player.held_item = PEPPER_ITEM.instantiate()
	close()

func _on_chicken_pressed() -> void:
	CHICKEN_ITEM.texture = CHICKEN_ITEM.default
	if not player.held_item: player.held_item = CHICKEN_ITEM.instantiate()
	close()

func _on_wine_pressed() -> void:
	WINE_ITEM.texture = WINE_ITEM.default
	if not player.held_item: player.held_item = WINE_ITEM.instantiate()
	close()

func _on_rice_pressed() -> void:
	RICE_ITEM.texture = RICE_ITEM.default
	if not player.held_item: player.held_item = RICE_ITEM.instantiate()
	close()

func _on_tofu_pressed() -> void:
	TOFU_ITEM.texture = TOFU_ITEM.default
	if not player.held_item: player.held_item = TOFU_ITEM.instantiate()
	close()

func _on_onions_pressed() -> void:
	ONIONS_ITEM.texture = ONIONS_ITEM.default
	if not player.held_item: player.held_item = ONIONS_ITEM.instantiate()
	close()

func _on_hot_sauce_pressed() -> void:
	HOT_SAUCE_ITEM.texture = HOT_SAUCE_ITEM.default
	if not player.held_item: player.held_item = HOT_SAUCE_ITEM.instantiate()
	close()

func _on_banana_pressed() -> void:
	BANANA.texture = BANANA.default
	if not player.held_item: player.held_item = BANANA.instantiate()
	close()

func _on_coconut_pressed() -> void:
	COCONUT.texture = COCONUT.default
	if not player.held_item: player.held_item = COCONUT.instantiate()
	close()

func _on_soy_sauce_pressed() -> void:
	SOY_CREAM.texture = SOY_CREAM.default
	if not player.held_item: player.held_item = SOY_CREAM.instantiate()
	close()

func _on_crust_pressed() -> void:
	CRUST.texture = CRUST.default
	if not player.held_item: player.held_item = CRUST.instantiate()
	close()
