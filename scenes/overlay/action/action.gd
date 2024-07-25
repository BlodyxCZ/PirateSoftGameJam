class_name Action
extends Button


const KEYBOARD_E = preload("res://assets/kenney/keyboard/keyboard_e_outline.svg")
const KEYBOARD_SPACE = preload("res://assets/kenney/keyboard/keyboard_space_outline.svg")

const XBOX_A = preload("res://assets/kenney/xbox/xbox_button_color_a_outline.svg")
const XBOX_RB = preload("res://assets/kenney/xbox/xbox_rb_outline.svg")

const PLAYSTATION_CROSS = preload("res://assets/kenney/ps4/playstation_button_color_cross_outline.svg")
const PLAYSTATION_R1 = preload("res://assets/kenney/ps4/playstation_trigger_r1_alternative_outline.svg")


enum BUTTONS {
	E,
	Q,
}

var current_button: BUTTONS = BUTTONS.E:
	set(value):
		match BUTTONS.keys()[value]:
			"E":
				if Global.controller == Global.controllers.PC:
					icon = KEYBOARD_E
				elif Global.controller == Global.controllers.XBOX:
					icon = XBOX_A
				else:
					icon = PLAYSTATION_CROSS
			"Q":
				if Global.controller == Global.controllers.PC:
					icon = KEYBOARD_SPACE
				elif Global.controller == Global.controllers.XBOX:
					icon = XBOX_RB
				else:
					icon = PLAYSTATION_R1
		current_button = value


func _process(_delta: float) -> void:
	current_button = current_button
