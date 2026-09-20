extends Sprite2D

var direction: Vector2
@export var speed: float
@export var value: int

func _ready() -> void:
	await get_tree().create_timer(30).timeout
	die()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += delta * direction * speed



func _on_area_2d_body_entered(_body: Node2D) -> void:
	get_node("../CanvasLayer/CoinCounter").refresh_coin_count(value)
	die()

func die() -> void:
	$Area2D/CollisionShape2D.set_deferred("disabled",true)
	$GPUParticles2D.emitting = false
	$GPUParticles2D.top_level = true
	var a = 1.0
	for i in range(11):
		self_modulate = Color(1.0, 1.0, 1.0, a)
		scale = Vector2(0.1,0.1)*a
		a -= 0.1
		await get_tree().process_frame
	await get_tree().create_timer($GPUParticles2D.lifetime).timeout
	queue_free()
