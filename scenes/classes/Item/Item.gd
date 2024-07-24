class_name Item
extends Resource


@export_group("Info")
@export var item_name: String = "name"
var texture: Texture


@export_group("Sprites")
@export var default: Texture
@export var cooked: Texture
@export var watered: Texture


func _init() -> void:
	texture = default


func cook() -> void:
	texture = cooked


func water() -> void:
	texture = watered
