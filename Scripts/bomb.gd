extends Sprite2D

var direction: Vector2
@export var speed: float

func _ready() -> void:
	await get_tree().create_timer(30).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += delta * direction * speed



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Person" && !body.immune:
		$BumperSFX.play()
		body.get_hit()
		$AnimationPlayer.play("Bump")
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play("RESET")
