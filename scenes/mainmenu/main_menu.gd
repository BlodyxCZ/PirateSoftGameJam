extends Control


func _ready() -> void:
	Overlay.hide_all()
	Audio.play("Title")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/01/Level01.tscn")
	Audio.stop_music()


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	pass # Replace with function body.
