class_name Action
extends Button


const KEYBOARD_E = preload("res://assets/kenney/keyboard/keyboard_e_outline.svg")
const KEYBOARD_F = preload("res://assets/kenney/keyboard/keyboard_f_outline.svg")
const KEYBOARD_Q = preload("res://assets/kenney/keyboard/keyboard_q_outline.svg")
const KEYBOARD_R = preload("res://assets/kenney/keyboard/keyboard_r_outline.svg")


enum BUTTONS {
	E,
	Q,
	R,
	F,
}

var current_button: BUTTONS = BUTTONS.E:
	set(value):
		match BUTTONS.keys()[value]:
			"E":
				icon = KEYBOARD_E
			"Q":
				icon = KEYBOARD_Q
			"R":
				icon = KEYBOARD_R
			"F":
				icon = KEYBOARD_F
