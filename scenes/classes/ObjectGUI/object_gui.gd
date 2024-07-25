class_name ObjectGUI
extends Control


@onready var player: Player = get_tree().get_first_node_in_group("Player")


func _ready() -> void:
	hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") or event.is_action_pressed("close") and visible:
		if event.is_action_pressed("close") and event is InputEventKey:
			Overlay.pause()
		close()


func open() -> void:
	player.frozen = true
	show()


func close() -> void:
	player.frozen = false
	hide()
