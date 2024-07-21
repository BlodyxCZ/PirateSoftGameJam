class_name IconButton
extends Button


@onready var _icon = icon


func _ready() -> void:
	focus_entered.connect(_on_focused)
	focus_exited.connect(_on_unfocused)
	_on_unfocused()

func _process(delta: float) -> void:
	if is_hovered():
		grab_focus()


func _on_focused() -> void:
	icon = _icon


func _on_unfocused() -> void:
	icon = null
