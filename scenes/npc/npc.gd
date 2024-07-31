extends Node3D


var is_in_range = false
var player: Player


var progress: int = 0


func _ready() -> void:
	$GPUParticles3D.emitting = true

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
	if event.is_action_pressed("interact1"):
		if is_in_range and not Overlay.is_in_dialogue():
			player.locked = true
			match progress:
				0:
					Overlay.show_ui("first")
					await Overlay.dialog_finished
					Overlay.hide_all()
					get_tree().get_first_node_in_group("Barrier").queue_free()
					progress = 1
				1:
					Overlay.show_ui("second")
					await Overlay.dialog_finished
					Overlay.hide_all()
				2:
					Overlay.show_ui("third")
					await Overlay.dialog_finished
					Overlay.hide_all()
					$AnimationPlayer.play("Dissappear")
					await $AnimationPlayer.animation_finished
					Overlay.show_ui("End")
			player.locked = false
