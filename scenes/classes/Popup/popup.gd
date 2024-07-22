class_name PopUp
extends Sprite3D


signal process_complete()
signal overprocess_complete()


func process(process_duration: float, overprocess_duration: float) -> void:
	show()
	$"../PopUpTexture".process = 0.0
	var tween: Tween = create_tween()
	tween.tween_property($"../PopUpTexture", "process", 100.0, process_duration)
	tween.play()
	await tween.finished
	process_complete.emit()
	overprocess(overprocess_duration)


func overprocess(duration: float) -> void:
	$"../PopUpTexture".over_process = 0.0
	var tween: Tween = create_tween()
	tween.tween_property($"../PopUpTexture", "over_process", 100.0, duration)
	tween.play()
	await tween.finished
	overprocess_complete.emit()
