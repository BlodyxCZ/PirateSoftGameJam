class_name Item
extends Resource


@export_group("Info")
@export var item_name: String = "name"
var texture: Texture
@export var action_texture: Texture

var order_id = 0


@export_group("Sprites")
@export var default: Texture
@export var cooked: Texture
@export var mixed: Texture
@export var chopped: Texture
@export var combined: Texture
@export var enchanted: Texture
@export var trashed: Texture

@export_group("Actions")
@export var action_cooked: Texture
@export var action_mixed: Texture
@export var action_chopped: Texture
@export var action_combined: Texture
@export var action_enchanted: Texture
@export var action_trashed: Texture

@export_group("Conditions")
@export var cook_condition: Array[String] = []
@export var water_condition: Array[String] = []
@export var chop_condition: Array[String] = []
@export var combine_condition: Array[String] = []
@export var second_combine_condition: Array[String] = []
@export var enchant_condition: Array[String] = []

func _init() -> void:
	texture = default

func cook() -> void:
	for condition in cook_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	if not item_name.find("Cooked") == -1:
		return
	texture = cooked
	item_name += "Cooked"
	refresh_order()

func water() -> void:
	for condition in water_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	if not item_name.find("Mixed") == -1:
		return
	texture = mixed
	item_name += "Mixed"
	refresh_order()

func chop() -> void:
	for condition in chop_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	if not item_name.find("Chopped") == -1:
		return
	texture = chopped
	item_name += "Chopped"
	refresh_order()

func combine(second_item: Item) -> bool:
	for condition in combine_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			return false
	for condition in second_combine_condition:
		if second_item.item_name.find(condition) == -1 or texture == trashed:
			return false
	texture = combined
	item_name += "Combined"
	refresh_order()
	return true


func enchant() -> void:
	for condition in enchant_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	if not item_name.find("Enchanted") == -1:
		return
	texture = enchanted
	item_name += "Enchanted"
	refresh_order()


func trash() -> void:
	texture = trashed
	refresh_order(true)


func refresh_order(trash: bool = false) -> void:
	Overlay.delete_order(order_id)
	if not trash:
		order_id = Overlay.add_order(texture, action_texture)


func instantiate() -> Item:
	var new = Item.new()
	
	new.item_name = item_name
	new.texture = default
	new.action_texture = action_texture
	
	new.default = default
	new.cooked = cooked
	new.mixed = mixed
	new.chopped = chopped
	new.combined = combined
	new.enchanted = enchanted
	new.trashed = trashed
	
	new.cook_condition = cook_condition
	new.chop_condition = chop_condition
	new.combine_condition = combine_condition
	new.second_combine_condition = second_combine_condition
	new.enchant_condition = enchant_condition
	
	refresh_order()
	
	return new
