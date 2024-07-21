extends Node


enum controllers {
	PC,
	XBOX,
	PS,
}


var controller: controllers = controllers.PC


func _input(event: InputEvent) -> void:
	if event is InputEventKey or event is InputEventMouse:
		controller = controllers.PC
	elif event is InputEventJoypadButton or event is InputEventJoypadMotion:
		if Input.get_joy_name(0).find("PS") != -1:
			controller = controllers.PS
		else:
			controller = controllers.XBOX
