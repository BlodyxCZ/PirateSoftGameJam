extends Node


signal transition_finished()


enum TYPE {
	fade_in_out = 0,
	swipe_left = 1,
	swipe_right = 2,
}

var current_transition: TYPE = TYPE.fade_in_out


func start_transition(duration: float, path_to_scene: String) -> void:
	match current_transition:
		TYPE.fade_in_out:
			fade_in_out(Color.BLACK, duration, path_to_scene)
		TYPE.swipe_left:
			swipe(1, duration, path_to_scene)
		TYPE.swipe_right:
			swipe(-1, duration, path_to_scene)


func fade_in_out(color: Color, duration: float, path_to_scene: String) -> void:
	var color_rect: ColorRect = ColorRect.new()
	color_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	color_rect.color = color
	color_rect.color.a = 0
	add_child(color_rect)
	var tween: Tween = create_tween()
	tween.tween_property(color_rect, "color:a", 1.0, duration)
	tween.tween_property(color_rect, "color:a", 0.0, duration)
	tween.play()
	await tween.step_finished
	get_tree().change_scene_to_file(path_to_scene)
	await tween.finished
	tween.kill()
	color_rect.queue_free()
	transition_finished.emit()


func swipe(direction: int, duration: float, path_to_scene: String) -> void:
	var new_scene: PackedScene = load(path_to_scene)
	var n_s: Node3D = new_scene.instantiate()
	n_s.name = "NewScene"
	n_s.global_position = Vector3(20 * direction, 0, 20 * -direction)
	var current_scene = get_tree().current_scene
	add_sibling(n_s)
	var tween: Tween = create_tween()
	tween.set_parallel()
	tween.tween_property(n_s, "global_position",  Vector3.ZERO, duration)
	tween.tween_property(current_scene, "global_position",  Vector3(20 * -direction, 0, 20 * direction), duration)
	tween.play()
	await tween.step_finished
	await tween.finished
	tween.kill()
	get_tree().unload_current_scene()
	get_tree().set_current_scene(n_s)
	transition_finished.emit()
