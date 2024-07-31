extends TextureRect


var id: int = 0


func _set_texture(_texture: Texture) -> void:
	$TextureRect.texture = _texture


func set_action(action: Texture) -> void:
	$TextureRect2.texture = action


func create(item: Texture, action: Texture) -> int:
	randomize()
	id = randi()
	_set_texture(item)
	set_action(action)
	return id
