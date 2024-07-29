extends Panel


func chef_say(duration: float, emotion: String = "Normal") -> void:
	for video: VideoStreamPlayer in $GhostChef.get_children():
		if video.name == emotion:
			video.show()
			video.play()
		else:
			video.hide()
		video.get_child(0).hide()
	
	await get_tree().create_timer(duration).timeout
	
	for video: VideoStreamPlayer in $GhostChef.get_children():
		if video.name == emotion:
			video.get_child(0).show()
		video.stop()
