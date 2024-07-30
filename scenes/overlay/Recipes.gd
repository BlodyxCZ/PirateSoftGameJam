extends Control


func hide_all() -> void:
	for page in $MarginContainer.get_children():
		page.hide()

func switch_to_page(number: int) -> void:
	hide_all()
	$MarginContainer.get_child(number-1).show()


func flip_left() -> void:
	var i = 0
	for page in $MarginContainer.get_children():
		i += 1
		if page.visible: break
	switch_to_page(i-1)


func flip_right() -> void:
	var i = 0
	for page in $MarginContainer.get_children():
		i += 1
		if page.visible: break
	switch_to_page(i+1)


func _on_right_pressed() -> void:
	flip_right()


func _on_left_pressed() -> void:
	flip_left()
