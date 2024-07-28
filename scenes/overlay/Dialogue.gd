extends Control


func _ready() -> void:
	$VampireSpeech.hide()
	$JackalopeSpeech.hide()
	$Vampire/TextureRect.hide()
	$Jackalope/TextureRect.hide()


func first_meeting() -> void:
	await get_tree().create_timer(1.0).timeout
	await vampire_say("Ungh…..", 1.0)
	await vampire_say("Oh….. Hello little… bunny?", 2.0)
	await vampire_say("Hmmm…. Sooo…. Hungry…..", 2.0)
	await vampire_say("You…. look… tasty…", 2.0)
	await vampire_say("But no… I can't….", 2.0)
	await vampire_say("I put together all these ingredients…", 3.0)
	await vampire_say("But I still need one more thing", 3.0)
	await vampire_say("Someone to put them together…", 3.0)
	Overlay.dialog_finished.emit()


func vampire_say(what: String, duration: float) -> void:
	$Vampire.play()
	$VampireSpeech.show()
	$VampireSpeech/VampireText.visible_ratio = 0.0
	$VampireSpeech/VampireText.text = what
	var tween: Tween = create_tween()
	tween.tween_property($VampireSpeech/VampireText, "visible_ratio", 1.0, duration)
	tween.play()
	await tween.finished
	$Vampire.stop()
	$Vampire.stream_position = 0.0
	await get_tree().create_timer(2.0).timeout
	$VampireSpeech.hide()


func jackalope_say(what: String, duration: float) -> void:
	$Jackalope.play()
	$JackalopeSpeech.show()
	$JackalopeSpeech/JackalopeText.visible_ratio = 0.0
	$JackalopeSpeech/JackalopeText.text = what
	var tween: Tween = create_tween()
	tween.tween_property($JackalopeSpeech/JackalopeText, "visible_ratio", 1.0, duration)
	tween.play()
	await tween.finished
	$Jackalope.stop()
	$Jackalope.stream_position = 0.0
	await get_tree().create_timer(2.0).timeout
	$JackalopeSpeech.hide()
