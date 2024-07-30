class_name Item
extends Resource


@export_group("Info")
@export var item_name: String = "name"
var texture: Texture


@export_group("Sprites")
@export var default: Texture
@export var cooked: Texture
@export var boiled: Texture
@export var watered: Texture
@export var chopped: Texture
@export var combined: Texture
@export var enchanted: Texture
@export var trashed: Texture

@export_group("Conditions")
@export var cook_condition: Array[String] = []
@export var boil_condition: Array[String] = []
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
	texture = cooked
	item_name += "Cooked"

func boil() -> void:
	for condition in boil_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	texture = boiled
	item_name += "Boiled"

func water() -> void:
	for condition in water_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	texture = watered
	item_name += "Watered"

func chop() -> void:
	for condition in chop_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	texture = chopped
	item_name += "Chopped"

func combine(second_item: Item) -> bool:
	for condition in combine_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			return false
	for condition in second_combine_condition:
		if second_item.item_name.find(condition) == -1 or texture == trashed:
			return false
	texture = combined
	item_name += "Combined"
	return true

func enchant() -> void:
	for condition in enchant_condition:
		if item_name.find(condition) == -1 or texture == trashed:
			texture = trashed
			return
	texture = enchanted
	item_name += "Enchanted"


func instantiate() -> Item:
	var new = Item.new()
	
	new.item_name = item_name
	new.texture = default
	
	new.default = default
	new.cooked = cooked
	new.boiled = boiled
	new.watered = watered
	new.chopped = chopped
	new.combined = combined
	new.enchanted = enchanted
	new.trashed = trashed
	
	new.cook_condition = cook_condition
	new.boil_condition = boil_condition
	new.chop_condition = chop_condition
	new.combine_condition = combine_condition
	new.second_combine_condition = second_combine_condition
	new.enchant_condition = enchant_condition
	
	return new
