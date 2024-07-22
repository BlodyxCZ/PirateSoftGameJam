extends Node3D


var is_in_range = false


func _on_area_3d_body_entered(body: Node3D) -> void:
	if not body is Player: return
	is_in_range = true



func _on_area_3d_body_exited(body: Node3D) -> void:
	if not body is Player: return
	is_in_range = false


func _input(event: InputEvent) -> void:
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		pass
		# dialogue open here
