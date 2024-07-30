class_name TransitionCamera
extends Camera3D


signal transition_complete()

var is_transitioning: bool = false


# Instantly switch form one camera to another
func quick_switch(from: Camera3D, to: Camera3D) -> void:
	from.current = false
	to.current = true


# Smoothly transition from one camera to another
func transition_switch(from: Camera3D, to: Camera3D, duration: float = 1.0) -> void:
	if is_transitioning:
		#for tween in get_tree().get_processed_tweens():
		#	tween.kill()
		is_transitioning = false
		transition_switch(self, to, duration)
	else:
		get_tree().get_first_node_in_group("Player").frozen = true
		# Prevent other transitions from begging
		is_transitioning = true
		
		# Initiate variables
		fov = from.fov
		cull_mask = from.cull_mask
		global_position = from.global_position
		global_rotation = from.global_rotation
		h_offset = from.h_offset
		v_offset = from.v_offset
		
		# Make camera current
		current = true
		
		# Create the tweens and tween properties
		var tween: Tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property(self, "transform", to.transform, duration).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "fov", to.fov, duration).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "h_offset", to.h_offset, duration).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "v_offset", to.v_offset, duration).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		
		# Wait for tween to complete
		await tween.finished
		
		# Emit signal on finished
		transition_complete.emit()
		
		# Make the second camera current
		to.current = true
		is_transitioning = false
		get_tree().get_first_node_in_group("Player").frozen = false
