extends RigidBody2D

@export var jump_force: int
var can_jump: bool = true
var immune: bool = false
var jumps_to_change: int = 10

func _process(delta: float) -> void:
	if can_jump && Input.is_action_just_pressed("action"):
		linear_velocity = Vector2(0,0)
		angular_velocity = 0
		apply_impulse(Vector2(0,-jump_force))
		
		if jumps_to_change == 0:
			jumps_to_change = 10
			$Chair/ChairChanger.change_chair()
		else: jumps_to_change -= 1
		
		$AnimatedSprite2D.play("Jump")
		var r = randi() % 3
		$JumpSFX.pitch_scale = 1 + r * 0.1
		$JumpSFX.play()
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.play("Sit")

func get_hit() -> void:
	if can_jump:
		$AnimatedSprite2D.play("Hit")
		immune = true
		modulate = Color(1.0, 1.0, 1.0, 0.5)
		can_jump = false
		linear_velocity = Vector2(0,0)
		angular_velocity = 0
		apply_impulse(Vector2(0,-jump_force))
		await get_tree().create_timer(3,false).timeout
		can_jump = true
		$AnimatedSprite2D.play("Sit")
		await get_tree().create_timer(2,false).timeout
		immune = false
		modulate = Color(1.0, 1.0, 1.0, 1.0)
