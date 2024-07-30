extends Node3D


signal wake()

@onready var player: Player = get_tree().get_first_node_in_group("Player")


func _ready() -> void:
	Overlay.hide_all()
	await $Prerender/AnimationPlayer.animation_finished
	Audio.play("Voice")
	$Cutscene/camera/CamPart/Camera3D/VideoStreamPlayer.play()
	$Prerender.hide()
	
	player.frozen = true
	player.sleep()
	$Cutscene/camera/CamPart/Camera3D.current = true
	$Cutscene/camera/AnimationPlayer.play("Action_001")
	$Cutscene/AnimationPlayer.play("Armature_007Action_001")
	$Cutscene/AnimationPlayer2.play("Armature_008Action_001")
	$Cutscene/AnimationPlayer3.play("Armature_009Action_001")
	$Cutscene/AnimationPlayer4.play("Cube_033Action_001")
	await $Cutscene/camera/CamPart/Camera3D/VideoStreamPlayer.finished
	$Cutscene/camera/CamPart/Camera3D/VideoStreamPlayer.hide()
	await $Cutscene/camera/AnimationPlayer.animation_finished
	SceneTransition.transition_switch($Cutscene/camera/CamPart/Camera3D, $Cameras/Intro)
	await SceneTransition.transition_complete
	
	$Cutscene.hide()
	Audio.play("Hub")
	
	await get_tree().create_timer(3.0).timeout
	Overlay.show_ui("intro")
	await wake
	Overlay.hide_all()
	await player.wake_up()
	SceneTransition.transition_switch($Cameras/Intro, $Cameras/Hub)
	await SceneTransition.transition_complete
	player.frozen = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact1"):
		wake.emit()


func _on_camera_trigger_body_entered(body: Node3D) -> void:
	if not body is Player: return
	Audio.play("Kitchen")
	SceneTransition.transition_switch($Cameras/Hub, $Cameras/Kitchen)
	await SceneTransition.transition_complete
	Overlay.show_ui("level")


func _on_camera_trigger_body_exited(body: Node3D) -> void:
	if not body is Player: return
	Audio.play("Hub")
	SceneTransition.transition_switch($Cameras/Kitchen, $Cameras/Hub)
	Overlay.hide_all()


func _on_door_trigger_body_entered(body: Node3D) -> void:
	if not body is Player: return
	var tween: Tween = create_tween()
	tween.tween_property($Objects/Kitchen/Door, "rotation:y", deg_to_rad(-82), 0.2)
	tween.play()


func _on_door_trigger_body_exited(body: Node3D) -> void:
	if not body is Player: return
	var tween: Tween = create_tween()
	tween.tween_property($Objects/Kitchen/Door, "rotation:y", deg_to_rad(0), 0.2)
	tween.play()


