class_name InteractableObject3D
extends Node3D

@export_group("Nodes")
@export var range: Area3D
@export var gui: ObjectGUI
@export var pop_up: PopUp
var is_in_range: bool = false

@export_group("Inventory")
@export var current_item: Item


func _ready() -> void:
	range.body_entered.connect(_on_body_entered)
	range.body_exited.connect(_on_body_exited)
	pop_up.hide()


func _input(event: InputEvent) -> void:
	if not is_in_range: return
	
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		if not gui.visible:
			gui.open()


func _on_body_entered(_body: Player) -> void:
	is_in_range = true


func _on_body_exited(_body: Player) -> void:
	is_in_range = false
	gui.close()
