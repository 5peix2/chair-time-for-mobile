extends Sprite2D

@export var moves: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await $AnimationPlayer.animation_finished
	queue_free()

func _physics_process(delta: float) -> void:
	if moves: global_position += Vector2(0,-100*delta)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
