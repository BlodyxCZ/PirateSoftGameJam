class_name Player
extends CharacterBody3D


enum STATES {
	idle,
	walk,
}

var current_state: STATES = STATES.idle


@onready var ap: AnimationPlayer = $jackalope/AnimationPlayer

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export_group("Movement")
@export var speed: float = 5.0
@export_range(0.0, 1.0) var acceleration: float = 0.5
@export_range(0.0, 1.0) var deceleration: float = 0.5
@export_range(0.0, 1.0) var rotation_factor: float = 0.2

@export_group("Cooking")
@export var held_item: Item:
	set(value):
		if value:
			$BoneAttachment3D/InventorySlot.texture = value.texture
			$jackalope/JackalopeRig/Skeleton3D/HornL/OmniLight3D.show()
			$jackalope/JackalopeRig/Skeleton3D/HornR/OmniLight3D.show()
		else:
			$BoneAttachment3D/InventorySlot.texture = null
			$jackalope/JackalopeRig/Skeleton3D/HornL/OmniLight3D.hide()
			$jackalope/JackalopeRig/Skeleton3D/HornR/OmniLight3D.hide()
		held_item = value

var frozen: bool = false


func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	_handle_states()


func _handle_movement(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var cam_rotation = 0
	for camera: Camera3D in get_tree().get_nodes_in_group("Camera"):
		if camera.current:
			cam_rotation = camera.rotation.y
	
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down").rotated(cam_rotation)
	var direction := (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and not frozen:
		$jackalope.rotation.y = lerp_angle($jackalope.rotation.y, Vector3(0, 0, 1).rotated(Vector3(0, 1, 0), PI).signed_angle_to(direction, Vector3(0, 1, 0)), rotation_factor)
		velocity.x = lerp(velocity.x, direction.x * speed, acceleration)
		velocity.z = lerp(velocity.z, direction.z * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, deceleration)
		velocity.z = lerp(velocity.z, 0.0, deceleration)
	
	move_and_slide()
	
	if abs(input_dir).is_equal_approx(Vector2.ZERO):
		if current_state != STATES.idle:
			current_state = STATES.idle
			ap.play("Idle")
	elif abs(input_dir) > Vector2.ZERO and not frozen:
		if current_state != STATES.walk:
			current_state = STATES.walk
			ap.play("Walk")


func _handle_states() -> void:
	pass
