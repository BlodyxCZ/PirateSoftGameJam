class_name ObjectGUI
extends Control


func _input(event: InputEvent) -> void:
	if event.is_action("interact2") and event.is_pressed() and not event.is_echo() and self.visible:
		await get_tree().create_timer(0.1).timeout
		close()


func _ready() -> void:
	hide()


func open() -> void:
	show()


func close() -> void:
	hide()
