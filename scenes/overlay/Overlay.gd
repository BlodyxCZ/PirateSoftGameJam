extends CanvasLayer


signal dialog_finished()
signal tutorial_finished()


const ORDER = preload("res://scenes/overlay/order/order.tscn")
const ACTION = preload("res://scenes/overlay/action/action.tscn")

var tutorial: bool = true


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()


func pause() -> void:
	if $Recipes.visible:
		$Recipes.visible = false
	else:
		$Pause/Resume.grab_focus()
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


func start_tutorial() -> void:
	hide_all()
	
	$Level.show()
	$Level/Orders.hide()
	$Level/Book.hide()
	$Level/Actions.hide()
	
	$Level/GhostChef.tutorial()
	
	
	SceneTransition.transition_switch(get_camera("Kitchen"), get_camera("First"))
	await SceneTransition.transition_complete
	get_tree().get_first_node_in_group("Player").locked = true
	get_tree().get_first_node_in_group("Player").to_idle()
	
	await $Level/GhostChef.trigger1
	
	var tween: Tween = create_tween()
	$Level/Book.modulate.a = 0.0
	$Level/Book.show()
	tween.tween_property($Level/Book, "modulate:a", 1.0, 1.0)
	tween.play()
	
	await $Level/GhostChef.trigger2
	
	$Level/Orders.show()
	$Level/Book.show()
	$Level/Actions.show()
	SceneTransition.transition_switch(get_camera("First"), get_camera("Kitchen"))
	
	await $Level/GhostChef.trigger3
	
	tutorial_finished.emit()


func get_camera(_name: String) -> Camera3D:
	for camera: Camera3D in get_tree().get_nodes_in_group("Camera"):
		if camera.name == _name:
			return camera
	return Camera3D.new()


func add_order(texture: Texture, action: Texture) -> int:
	var order: TextureRect = ORDER.instantiate()
	%OrderList.add_child(order)
	return order.create(texture, action)


func delete_order(id: int) -> void:
	for order in %OrderList.get_children():
		if order.id == id:
			order.queue_free()
