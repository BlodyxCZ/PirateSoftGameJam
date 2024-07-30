extends Node


var master_volume: float = 1.0
var music_volume: float = 1.0
var voice_volume: float = 1.0


func play(audio: String) -> void:
	for child: AudioStreamPlayer in get_children():
		if child.name == audio:
			if child.is_in_group("Music"):
				stop_music(child.name)
				var tween: Tween = create_tween()
				child.volume_db = linear_to_db(0.01)
				tween.tween_property(child, "volume_db", linear_to_db(0.5 * master_volume * music_volume), 2.0)
				tween.play()
			child.play()


func stop_music(_name: String = "") -> void:
	for audio: AudioStreamPlayer in get_tree().get_nodes_in_group("Music"):
		if not audio.playing: continue
		elif audio.name == _name: continue
		else:
			var tween: Tween = create_tween()
			audio.volume_db = linear_to_db(0.5 * master_volume * music_volume)
			tween.tween_property(audio, "volume_db", linear_to_db(0.01), 2.0)
			tween.play()
			await tween.finished
			audio.stop()


func _process(delta: float) -> void:
	for child: AudioStreamPlayer in get_children():
		if not get_tree().get_processed_tweens().size() >= 1:
			if child.is_in_group("Music"):
				child.volume_db = linear_to_db(0.5 * master_volume * music_volume)
			if child.is_in_group("Voice"):
				child.volume_db = linear_to_db(0.5 * master_volume * voice_volume)
