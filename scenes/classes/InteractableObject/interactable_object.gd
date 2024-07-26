class_name InteractableObject3D
extends Node3D

@export_group("Nodes")
@export var range: Area3D
@export var gui: ObjectGUI
@export var pop_up: PopUp
var is_in_range: bool = false

@export_group("Inventory")
@export var current_item: Item:
	set(value):
		if get_tree() == null:
			await tree_entered
		if value:
			if not value.texture: value.texture = value.default
			if $InventorySlot:
				$InventorySlot.texture = value.texture
		else:
			if $InventorySlot:
				$InventorySlot.texture = null
		current_item = value

@onready var player: Player = get_tree().get_first_node_in_group("Player")


func _ready() -> void:
	range.body_entered.connect(_on_body_entered)
	range.body_exited.connect(_on_body_exited)
	pop_up.hide()


func _on_body_entered(_body: Player) -> void:
	is_in_range = true


func _on_body_exited(_body: Player) -> void:
	is_in_range = false
	gui.close()
