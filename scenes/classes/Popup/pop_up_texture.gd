extends SubViewport


func _process(_delta: float) -> void:
	for child in $Interact.get_children():
		if child.name == Global.controllers.keys()[Global.controller]:
			child.show()
		else:
			child.hide()
