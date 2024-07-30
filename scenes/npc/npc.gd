extends Node3D


var is_in_range = false
var player: Player


var progress: int = 0


func _on_area_3d_body_entered(body: Node3D) -> void:
	if not body is Player: return
	is_in_range = true
	player = body
	Overlay.show_ui("intro")



func _on_area_3d_body_exited(body: Node3D) -> void:
	if not body is Player: return
	is_in_range = false
	Overlay.hide_all()


func _input(event: InputEvent) -> void:
	if event.is_action("interact1") and event.is_pressed() and not event.is_echo():
		if is_in_range and not Overlay.is_in_dialogue():
			player.frozen = true
			match progress:
				0:
					Overlay.show_ui("dialogue")
					await Overlay.dialog_finished
					Overlay.hide_all()
					get_tree().get_first_node_in_group("Barrier").queue_free()
					progress += 1
				1:
					pass
			player.frozen = false
