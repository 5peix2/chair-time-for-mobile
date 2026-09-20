extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_position.y > 5000:
		global_position = Vector2(0,-2000)
		linear_velocity = Vector2(0,0)
		angular_velocity = 0
		reset_physics_interpolation()
		#var new_ball = BALL.instantiate()
		#get_parent().add_child(new_ball)
		#new_ball.global_position = Vector2(0,-1000)
		#new_ball.reset_physics_interpolation()
		#queue_free()


func _on_body_entered(body: Node) -> void:
	SceneTransitionEffect.playBallSound()
