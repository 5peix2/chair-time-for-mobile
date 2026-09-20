extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func inAnim(scene_name: String) -> void:
	playInSound()
	layer = 2
	$ChairTransitionImage/AnimationPlayer.play("transition")
	await $ChairTransitionImage/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/" + scene_name + ".tscn")
	outAnim()

func outAnim() -> void:
	playOutSound()
	$ChairTransitionImage/AnimationPlayer.play_backwards("transition")
	await $ChairTransitionImage/AnimationPlayer.animation_finished
	layer = -1

func play_hover_sound() -> void:
	$HoverSound.play()

func play_click_sound() -> void:
	$ClickSound.play()

func playInSound() -> void:
	$TransitionIn.play()

func playOutSound() -> void:
	await get_tree().create_timer(0.6).timeout
	$TransitionOut.play()

func playBallSound() -> void:
	var r = randi()%5
	$BonkSFX.pitch_scale = 1 + r * 0.1
	$BonkSFX.play()
