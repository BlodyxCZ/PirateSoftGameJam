class_name PopUp
extends Sprite3D


signal process_complete()
signal overprocess_complete()
signal step_finished()


var tweens: Array[Tween] = []


func process(process_duration: float, overprocess_duration: float) -> void:
	show()
	$"../PopUpTexture".process = 0.0
	var tween: Tween = create_tween()
	tweens.append(tween)
	tween.tween_property($"../PopUpTexture", "process", 100.0, process_duration)
	tween.play()
	await tween.finished
	process_complete.emit()
	overprocess(overprocess_duration)


func overprocess(duration: float) -> void:
	$"../PopUpTexture".over_process = 0.0
	var tween: Tween = create_tween()
	tweens.append(tween)
	tween.tween_property($"../PopUpTexture", "over_process", 100.0, duration)
	tween.play()
	await tween.finished
	overprocess_complete.emit()


func step_process(amount: float, duration: float) -> void:
	show()
	if $"../PopUpTexture".process >= 100.0:
		var tween: Tween = create_tween()
		tweens.append(tween)
		tween.tween_property($"../PopUpTexture", "over_process", $"../PopUpTexture".over_process + amount, duration)
		tween.play()
		await tween.finished
		step_finished.emit()
	else:
		var tween: Tween = create_tween()
		tweens.append(tween)
		tween.tween_property($"../PopUpTexture", "process", $"../PopUpTexture".process + amount, duration)
		tween.play()
		await tween.finished
		step_finished.emit()


func end_process() -> void:
	$"../PopUpTexture".process = 0.0
	$"../PopUpTexture".over_process = 0.0
	for tween: Tween in tweens:
		tween.kill()
	hide()
