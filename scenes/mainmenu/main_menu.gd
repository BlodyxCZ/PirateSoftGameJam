extends Control


func _ready() -> void:
	Overlay.hide_all()
	Audio.play("Title")


func _on_play_pressed() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($Fade, "color:a", 1.0, 2.0)
	tween.play()
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/levels/01/Level01.tscn")
	Audio.stop_music()


func _on_settings_pressed() -> void:
	Overlay.show_ui("options")


func _on_credits_pressed() -> void:
	$Credits.show()
