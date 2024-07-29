extends TextureRect


func _set_texture(_texture: Texture) -> void:
	$TextureRect.texture = _texture


func set_description(description: String) -> void:
	$Label.text = description
