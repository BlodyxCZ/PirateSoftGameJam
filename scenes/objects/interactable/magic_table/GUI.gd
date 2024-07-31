extends ObjectGUI


func open() -> void:
	super.open()
	if get_parent().get_parent().current_item:
		$Panel/Item.texture = get_parent().get_parent().current_item.texture
	else:
		$Panel/Item.texture = null


func _on_slot_1_pressed() -> void:
	if $Panel/Item.texture == null: return
	$Panel/Slot1/Item.texture = $Panel/Item.texture
	$Panel/Item.texture = null
	get_parent().get_parent().current_item = null

func _on_slot_2_pressed() -> void:
	if $Panel/Item.texture == null: return
	$Panel/Slot2/Item.texture = $Panel/Item.texture
	$Panel/Item.texture = null
	get_parent().get_parent().current_item = null

func _on_slot_3_pressed() -> void:
	if $Panel/Item.texture == null: return
	$Panel/Slot3/Item.texture = $Panel/Item.texture
	$Panel/Item.texture = null
	get_parent().get_parent().current_item = null

func _on_slot_4_pressed() -> void:
	if $Panel/Item.texture == null: return
	$Panel/Slot4/Item.texture = $Panel/Item.texture
	$Panel/Item.texture = null
	get_parent().get_parent().current_item = null


func _on_spring_pressed() -> void:
	if $Panel/Slot1/Item.texture == load("res://assets/items/Onions/onions.png") or $Panel/Slot2/Item.texture == load("res://assets/items/Onions/onions.png") or $Panel/Slot3/Item.texture == load("res://assets/items/Onions/onions.png") or $Panel/Slot4/Item.texture == load("res://assets/items/Onions/onions.png"):
		get_parent().get_parent().current_item.enchant()
		close()


func _on_blood_essence_pressed() -> void:
	if $Panel/Slot1/Item.texture == load("res://assets/items/Complete/b-c pie.png") or $Panel/Slot2/Item.texture == load("res://assets/items/Complete/b-c pie.png") or $Panel/Slot3/Item.texture == load("res://assets/items/Complete/b-c pie.png") or $Panel/Slot4/Item.texture == load("res://assets/items/Complete/b-c pie.png"):
		if $Panel/Slot1/Item.texture == load("res://assets/items/Complete/pepper .png") or $Panel/Slot2/Item.texture == load("res://assets/items/Complete/pepper .png") or $Panel/Slot3/Item.texture == load("res://assets/items/Complete/pepper .png") or $Panel/Slot4/Item.texture == load("res://assets/items/Complete/pepper .png"):
			if $Panel/Slot1/Item.texture == load("res://assets/items/Complete/rat.png") or $Panel/Slot2/Item.texture == load("res://assets/items/Complete/rat.png") or $Panel/Slot3/Item.texture == load("res://assets/items/Complete/rat.png") or $Panel/Slot4/Item.texture == load("res://assets/items/Complete/rat.png"):
				if $Panel/Slot1/Item.texture == load("res://assets/items/Complete/tofu.png") or $Panel/Slot2/Item.texture == load("res://assets/items/Complete/tofu.png") or $Panel/Slot3/Item.texture == load("res://assets/items/Complete/tofu.png") or $Panel/Slot4/Item.texture == load("res://assets/items/Complete/tofu.png"):
					get_parent().get_parent().current_item.enchant()
					close()
