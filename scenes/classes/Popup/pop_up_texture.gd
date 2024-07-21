extends SubViewport


func _process(_delta: float) -> void:
	for child in get_children():
		if child is Sprite2D:
			if child.name == Global.controllers.keys()[Global.controller]:
				child.show()
			else:
				child.hide()
