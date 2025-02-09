extends Control


func _ready() -> void:
	randomize()
	$VampireSpeech.hide()
	$JackalopeSpeech.hide()


func first_meeting() -> void:
	await vampire_say("Ungh…..", 0.5, "Sleepy")
	await vampire_say("Oh….. Hello little… bunny?", 1.0, "Sad")
	await vampire_say("Hmmm…. Sooo…. Hungry…..", 1.0, "Sad")
	await vampire_say("You…. look… tasty…", 1.0, "Wide")
	await vampire_say("But no… I can't….", 1.0, "Normal")
	await vampire_say("I put together all these ingredients…", 1.5, "Normal")
	await vampire_say("But I still need one more thing", 1.5, "Normal")
	await vampire_say("Someone to put them together…", 1.5, "Happy")
	Overlay.dialog_finished.emit()


func hungry() -> void:
	await vampire_say("Ungh…..", 0.5, "Sleepy")
	Overlay.dialog_finished.emit()


func delivery() -> void:
	await vampire_say("Ungh….. Hrmm?", 0.5, "Sleepy")
	await vampire_say("Ohh… that smell… delicious… can I have it?", 1.2, "Wide")
	await vampire_say("Thank you so much!", 0.5, "Happy")
	await vampire_say("NOM! NOM! NOM!", 1.5, "Happy")
	await vampire_say("Oh that was so good! ", 1.0, "Happy")
	await vampire_say("I can feel my energy returning to me…", 1.5, "Happy")
	await vampire_say("I wish I could stay longer to thank you somehow…", 1.6, "Normal")
	await vampire_say("But it seems day is rapidly approaching.", 1.5, "Sad")
	await vampire_say("I must be on my way", 1.0, "Sad")
	await vampire_say("Goodbye little horned rabbit creature!", 1.2, "Happy")
	Overlay.dialog_finished.emit()


func vampire_say(what: String, duration: float, emotion: String = "Normal") -> void:
	for video: VideoStreamPlayer in $Vampire.get_children():
		if video.name == emotion:
			video.show()
			video.play()
		else:
			video.hide()
		video.get_child(0).hide()
	$VampireSpeech.show()
	
	Audio.play("VampireTalk" + str(randi_range(1, 3)))
	
	$VampireSpeech/VampireText.visible_ratio = 0.0
	$VampireSpeech/VampireText.text = what
	var tween1: Tween = create_tween()
	tween1.tween_property($VampireSpeech/VampireText, "visible_ratio", 1.0, duration)
	tween1.play()
	await tween1.finished
	
	for video: VideoStreamPlayer in $Vampire.get_children():
		if video.name == emotion:
			video.get_child(0).show()
		video.stop()
	
	var tween2: Tween = create_tween()
	tween2.tween_property($VampireSpeech/VampireText, "visible_ratio", 1.0, 100)
	tween2.play()
	await tween2.finished
	
	$VampireSpeech.hide()

func jackalope_say(what: String, duration: float, emotion: String = "normal") -> void:
	for video: VideoStreamPlayer in $Jackalope.get_children():
		if video.name == emotion:
			video.show()
			video.play()
		else:
			video.hide()
		video.get_child(0).hide()
	$JackalopeSpeech.show()
	
	$JackalopeSpeech/JackalopeText.visible_ratio = 0.0
	$JackalopeSpeech/JackalopeText.text = what
	var tween: Tween = create_tween()
	tween.tween_property($JackalopeSpeech/JackalopeText, "visible_ratio", 1.0, duration)
	tween.play()
	await tween.finished
	
	for video: VideoStreamPlayer in $Jackalope.get_children():
		if video.name == emotion:
			video.get_child(0).show()
		video.stop()
	
	tween.tween_property($JackalopeSpeech/JackalopeText, "visible_ratio", 1.0, duration)
	tween.play()
	await tween.finished
	$JackalopeSpeech.hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact1") and Overlay.is_in_dialogue():
		for tween: Tween in get_tree().get_processed_tweens():
			tween.set_speed_scale(1000.0)
