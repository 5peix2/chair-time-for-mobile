extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BoxAnim/AnimationPlayer.play("open")
	playSFX()
	await $BoxAnim/AnimationPlayer.animation_finished
	queue_free()

func setBoxColor(c: Color) -> void:
	$BoxAnim.modulate = c

func playSFX() -> void:
	await get_tree().create_timer(1,false).timeout
	$BoxFallSFX.play()
	await get_tree().create_timer(1,false).timeout
	$BoxOpenSFX.play()
