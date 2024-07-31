extends Panel


signal trigger1()
signal trigger2()
signal trigger3()



func _ready() -> void:
	randomize()
	$GhostChefSpeech.hide()


func tutorial() -> void:
	get_tree().get_first_node_in_group("Player").locked = true
	#TODO: Starts zoomed in on the jackalope walking into the restaurant and zooms out to show the kitchen.
	await chef_say("Alright little jackalope, that vampire fellow needs food, and he needs it fast.", 2.0, "Normal")
	await chef_say("Let’s look at the ingredients he gave us…", 1.5, "Normal")
	await chef_say("Hrm… tofu, quinoa, some vegan sauces, soy milk…", 1.5, "Normal")
	await chef_say("Yes indeed, it looks like this vampire friend of ours has some interesting dietary restrictions.", 2.0, "Normal")
	await chef_say("No matter, I know just what to do. ", 1.0, "Normal")
	#TODO: animate the recipe book appearing in the bottom left of the screen
	trigger1.emit()
	await chef_say("Here’s a recipe book, it’s magical and takes stock of the resources at your disposal, and the best food you can make from it.", 3.0, "Normal")
	await chef_say("Follow these recipes and you can be sure to satisfy any who come to you for food.", 2.0, "Normal")
	await chef_say("This little tool has been passed down from master to apprentice for ages.", 2.0, "Normal")
	await chef_say("Utilizing it brought me to three star status once I had developed my skills", 2.0, "Normal")
	await chef_say("No small feat for any chef in this city.", 1.5, "Normal")
	await chef_say("Open it up with [TAB]", 1.0, "Normal", 0.0)
	#TODO: prompt the player to press the tab key, and once they do, open the recipe book
	await $"../Book".pressed
	await chef_say("Here there is a page for each recipe.", 1.0, "Normal")
	await chef_say("On the left is a description of the dish, and on the right is a set of steps you must follow to complete said dish.", 3.0, "Normal")
	await chef_say("Each step consists of a card.", 1.0, "Normal")
	await chef_say("This card shows the necessary ingredients...", 1.5, "Normal")
	await chef_say("...and tells you what to do with them", 1.0, "Normal")
	await chef_say("One last thing, reading this book does not slow the passage of time, so be careful to only look at it when you are confident you won’t fail to retrieve your food before it is lost.", 4.0, "Normal")
	await chef_say("You can exit the recipe book with either [TAB] or [ESC]", 1.5, "Normal", 0.0)
	await $"../Book".pressed
	await chef_say("I’ll put the ingredients in the fridge for now, you can retrieve them as you need.", 2.0, "Normal")
	#TODO: animate the chef going over there, then poofing away and reappearing in the top right corner as the rest of the kitchen UI appears
	trigger2.emit()
	await chef_say("All of the stations are marked with their respective icons...", 1.5, "Normal")
	await chef_say("...and in order to interact with ingredients or stations, press [LMB]/[E] or [SPACE]", 1.0, "Normal")
	await chef_say("With that, I believe you have all of the information you need to begin cooking", 1.0, "Normal")
	await chef_say("Chop chop!", 1.0, "Normal")
	#player gains control
	get_tree().get_first_node_in_group("Player").locked = false
	$GhostChefSpeech.hide()
	trigger3.emit()


func chef_say(what: String, duration: float, emotion: String = "Normal", x: float = 100) -> void:
	for video: VideoStreamPlayer in $GhostChef.get_children():
		if video.name == emotion:
			video.show()
			video.play()
		else:
			video.hide()
		video.get_child(0).hide()
	$GhostChefSpeech.show()
	
	Audio.play("ChefTalk" + str(randi_range(1, 3)))
	
	$GhostChefSpeech/JackalopeText.visible_ratio = 0.0
	$GhostChefSpeech/JackalopeText.text = what
	var tween1: Tween = create_tween()
	tween1.tween_property($GhostChefSpeech/JackalopeText, "visible_ratio", 1.0, duration)
	tween1.play()
	await tween1.finished
	
	for video: VideoStreamPlayer in $GhostChef.get_children():
		if video.name == emotion:
			video.get_child(0).show()
		video.stop()
	
	var tween2: Tween = create_tween()
	tween2.tween_property($GhostChefSpeech/JackalopeText, "visible_ratio", 1.0, x)
	tween2.play()
	await tween2.finished


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact1") and $GhostChefSpeech.visible:
		for tween: Tween in get_tree().get_processed_tweens():
			tween.set_speed_scale(1000.0)
