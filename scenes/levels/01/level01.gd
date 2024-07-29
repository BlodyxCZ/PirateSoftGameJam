extends Node3D


signal wake()

@onready var player: Player = get_tree().get_first_node_in_group("Player")


func _ready() -> void:
	Overlay.hide_all()
	
	player.frozen = true
	#play asleep animation
	await get_tree().create_timer(3.0).timeout
	Overlay.show_ui("intro")
	await wake
	Overlay.hide_all()
	#play idle animation
	SceneTransition.transition_switch($Cameras/Intro, $Cameras/Hub)
	await SceneTransition.transition_complete
	player.frozen = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact1"):
		wake.emit()


func _on_camera_trigger_body_entered(body: Node3D) -> void:
	if not body is Player: return
	SceneTransition.transition_switch($Cameras/Hub, $Cameras/Kitchen)


func _on_camera_trigger_body_exited(body: Node3D) -> void:
	if not body is Player: return
	SceneTransition.transition_switch($Cameras/Kitchen, $Cameras/Hub)
