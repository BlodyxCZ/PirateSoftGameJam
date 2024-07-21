extends CharacterBody3D


var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var speed: float = 5.0
@export_range(0.0, 1.0) var acceleration: float = 0.5
@export_range(0.0, 1.0) var deceleration: float = 0.5
@export_range(0.0, 1.0) var rotation_factor: float = 0.2



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down").rotated(-PI/4)
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		print(rad_to_deg(Vector3(0, 0, 1).rotated(Vector3(0, 1, 0), -PI/4).signed_angle_to(direction, Vector3(0, 1, 0))))
		$jackalope.rotation.y = lerp_angle($jackalope.rotation.y, Vector3(0, 0, 1).rotated(Vector3(0, 1, 0), PI).signed_angle_to(direction, Vector3(0, 1, 0)), rotation_factor)
		velocity.x = lerp(velocity.x, direction.x * speed, acceleration)
		velocity.z = lerp(velocity.z, direction.z * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, deceleration)
		velocity.z = lerp(velocity.z, 0.0, deceleration)
	
	move_and_slide()
