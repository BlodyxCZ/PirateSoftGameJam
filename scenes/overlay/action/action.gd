class_name Action
extends Button


const KEYBOARD_E = preload("res://assets/kenney/keyboard/keyboard_e_outline.svg")
const KEYBOARD_F = preload("res://assets/kenney/keyboard/keyboard_f_outline.svg")
const KEYBOARD_Q = preload("res://assets/kenney/keyboard/keyboard_q_outline.svg")
const KEYBOARD_R = preload("res://assets/kenney/keyboard/keyboard_r_outline.svg")

const XBOX_A = preload("res://assets/kenney/xbox/xbox_button_color_a_outline.svg")
const XBOX_B = preload("res://assets/kenney/xbox/xbox_button_color_b_outline.svg")
const XBOX_X = preload("res://assets/kenney/xbox/xbox_button_color_x_outline.svg")
const XBOX_Y = preload("res://assets/kenney/xbox/xbox_button_color_y_outline.svg")

const PLAYSTATION_CIRCLE = preload("res://assets/kenney/ps4/playstation_button_color_circle_outline.svg")
const PLAYSTATION_CROSS = preload("res://assets/kenney/ps4/playstation_button_color_cross_outline.svg")
const PLAYSTATION_SQUARE = preload("res://assets/kenney/ps4/playstation_button_color_square_outline.svg")
const PLAYSTATION_TRIANGLE = preload("res://assets/kenney/ps4/playstation_button_color_triangle_outline.svg")

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
				if Global.controller == Global.controllers.PC:
					icon = KEYBOARD_E
				elif Global.controller == Global.controllers.XBOX:
					icon = XBOX_A
				else:
					icon = PLAYSTATION_CROSS
			"Q":
				if Global.controller == Global.controllers.PC:
					icon = KEYBOARD_Q
				elif Global.controller == Global.controllers.XBOX:
					icon = XBOX_X
				else:
					icon = PLAYSTATION_SQUARE
			"R":
				if Global.controller == Global.controllers.PC:
					icon = KEYBOARD_R
				elif Global.controller == Global.controllers.XBOX:
					icon = XBOX_B
				else:
					icon = PLAYSTATION_CIRCLE
			"F":
				if Global.controller == Global.controllers.PC:
					icon = KEYBOARD_F
				elif Global.controller == Global.controllers.XBOX:
					icon = XBOX_Y
				else:
					icon = PLAYSTATION_TRIANGLE
		current_button = value


func _process(_delta: float) -> void:
	current_button = current_button
