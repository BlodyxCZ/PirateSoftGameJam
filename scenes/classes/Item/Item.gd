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

@export_group("Conditions")
@export var cook_condition: Array[String] = [""]
@export var boil_condition: Array[String] = [""]
@export var water_condition: Array[String] = [""]
@export var chop_condition: Array[String] = [""]
@export var combine_condition: Array[String] = [""]
@export var second_combine_condition: Array[String] = [""]
@export var enchant_condition: Array[String] = [""]

func _init() -> void:
	texture = default

func cook() -> void:
	for condition in cook_condition:
		if item_name.find(condition) == -1:
			return
	texture = cooked
	item_name += "Cooked"

func boil() -> void:
	for condition in boil_condition:
		if item_name.find(condition) == -1:
			return
	texture = boiled
	item_name += "Boiled"

func water() -> void:
	for condition in water_condition:
		if item_name.find(condition) == -1:
			return
	texture = watered
	item_name += "Watered"

func chop() -> void:
	for condition in chop_condition:
		if item_name.find(condition) == -1:
			return
	texture = chopped
	item_name += "Chopped"

func combine(second_item: Item) -> bool:
	for condition in combine_condition:
		if item_name.find(condition) == -1:
			return false
	for condition in second_combine_condition:
		if item_name.find(condition) == -1:
			return false
	texture = combined
	item_name += "Combined"
	return true

func enchant() -> void:
	for condition in enchant_condition:
		if item_name.find(condition) == -1:
			return
	texture = enchanted
	item_name += "Enchanted"
