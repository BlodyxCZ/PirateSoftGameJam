class_name InteractableObject3D
extends Node3D

@export var range: Area3D
@export var gui: ObjectGUI
@export var pop_up: PopUp
var is_in_range: bool = false


func _ready() -> void:
	range.body_entered.connect(_on_body_entered)
	range.body_exited.connect(_on_body_exited)
	pop_up.hide()


func _input(event: InputEvent) -> void:
	if event.is_action("interact") and event.is_pressed() and not event.is_echo():
		if is_in_range and not gui.visible:
			gui.open()


func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group("Player"): return
	is_in_range = true
	pop_up.fade_in(0.3)


func _on_body_exited(body: Node3D) -> void:
	if not body.is_in_group("Player"): return
	is_in_range = false
	pop_up.fade_out(0.3)
	gui.close()
