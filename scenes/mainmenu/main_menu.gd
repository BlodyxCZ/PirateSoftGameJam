extends Control


func _ready() -> void:
	Overlay.hide_all()
	await $Prerender/AnimationPlayer.animation_finished
	$Prerender.hide()
	Audio.play("Title")


func _on_play_pressed() -> void:
	Audio.stop_music()
	var tween: Tween = create_tween()
	tween.tween_property($Fade, "color:a", 1.0, 2.0)
	tween.play()
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/levels/01/Level01.tscn")


func _on_settings_pressed() -> void:
	Overlay.show_ui("options")


func _on_credits_pressed() -> void:
	$Credits.show()
