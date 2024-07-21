class_name PopUp
extends Sprite3D


func fade_in(duration: float) -> void:
	show()
	modulate.a = 0.0
	var tween: Tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, duration)
	tween.play()


func fade_out(duration: float) -> void:
	modulate.a = 1.0
	var tween: Tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, duration)
	tween.play()
	await tween.finished
	hide()
