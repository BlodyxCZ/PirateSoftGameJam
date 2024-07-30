extends CanvasLayer


signal dialog_finished()


const ACTION = preload("res://scenes/overlay/action/action.tscn")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()


func pause() -> void:
	$Pause/MarginContainer/VBoxContainer2/VBoxContainer/Resume.grab_focus()
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_PAUSABLE
	get_tree().paused = !get_tree().paused
	$Pause.visible = get_tree().paused

func _on_resume_pressed() -> void:
	pause()


#region Level
func _on_book_pressed() -> void:
	$Recipes.visible = not $Recipes.visible

func add_action(button: Action.BUTTONS, text: String) -> void:
	var action: Action = ACTION.instantiate()
	action.current_button = button
	action.set_text(text)
	%ActionList.add_child(action)

func remove_action(action: Action) -> void:
	for child in %ActionList.get_children():
		if child == action:
			child.queue_free()

func remove_action_by_index(index: int) -> void:
	%ActionList.get_child(index).queue_free()

func remove_action_by_text(text: String) -> void:
	for child in %ActionList.get_children():
		if child.text == text:
			child.queue_free()
#endregion


func hide_all() -> void:
	for child in get_children():
		child.hide()


func show_ui(_name: String) -> void:
	hide_all()
	match _name:
		"level":
			$Level.show()
		"hub":
			$Hub.show()
		"intro":
			$Intro.show()
		"dialogue":
			$Dialogue.show()
			$Dialogue.first_meeting()
		"options":
			$Options.show()


func is_in_dialogue() -> bool:
	return $Dialogue.visible


func chef_say(duration: float, emotion: String = "Normal") -> void:
	$Level/GhostChef.chef_say(duration, emotion)


func _on_button_pressed() -> void:
	$Options.hide()
