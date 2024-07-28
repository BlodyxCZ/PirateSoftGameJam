extends Node3D


signal wake()


func _ready() -> void:
	Overlay.hide_all()
	
	#freeze player
	#play asleep animation
	await get_tree().create_timer(3.0).timeout
	Overlay.show_ui("intro")
	await wake
	Overlay.hide_all()
	#play idle animation
	SceneTransition.transition_switch($Cameras/Intro, $Cameras/Hub)
	await SceneTransition.transition_complete
	#unfreeze the player


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact1"):
		wake.emit()
