extends Node


func _ready() -> void:
	for child: AudioStreamPlayer in get_children():
		child.volume_db = linear_to_db(0.5)


func play(audio: String) -> void:
	for child: AudioStreamPlayer in get_children():
		if child.name == audio:
			if child.is_in_group("Music"): stop_music()
			child.play()


func stop_music() -> void:
	for audio: AudioStreamPlayer in get_tree().get_nodes_in_group("Music"):
		audio.stop()
