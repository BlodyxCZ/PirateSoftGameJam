@tool
extends SubViewport


@export var process: float:
	set(value):
		$Process.value = value
	get:
		return $Process.value

@export var over_process: float:
	set(value):
		$Overprocess.value = value
	get:
		return $Overprocess.value


func reset() -> void:
	over_process = 0.0
	process = 0.0
