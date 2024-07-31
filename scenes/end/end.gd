extends ColorRect


func start() -> void:
	var tween: Tween = create_tween()
	color.a = 1.0
	tween.tween_property(self, "color:a", 0, 5.0)
	tween.play()
	get_tree().get_first_node_in_group("Player").locked = true
	get_tree().get_first_node_in_group("Player").frozen = true
