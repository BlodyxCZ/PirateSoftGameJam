extends Node


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
			pass
		TYPE.swipe_right:
			pass


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
