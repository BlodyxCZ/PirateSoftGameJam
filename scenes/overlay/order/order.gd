extends TextureRect


func _set_texture(texture: Texture) -> void:
	$TextureRect.texture = texture


func set_description(description: String) -> void:
	$Label.text = description
