extends Node2D

const BONK = preload("res://Scenes/bonk_vfx.tscn")
const WIGGLE = preload("res://Scenes/wiggle_vfx.tscn")
const COIN_VFX = preload("res://Scenes/coin_vfx.tscn")
var near = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !$Timer.is_stopped():
		$Chair.global_position.x = (1 - $Timer.time_left) * 5000
		$VisualCue.global_position.x = (1 - $Timer.time_left) * 500 + 8
		$VisualCue.modulate.a = 2 - $Timer.time_left
		$VisualCue2.global_position.x = (1 - $Timer.time_left) * -500 - 8
		$VisualCue2.modulate.a = 2 - $Timer.time_left

func _on_timer_timeout() -> void:
	create_bonk()
	$CanvasLayer/VBoxContainer/TimeLabel.text = str(snapped(1 - $Timer.time_left,0.0001)) + " seconds late"

func create_bonk() -> void:
	$Person.play("Fail")
	await get_tree().create_timer(0.2).timeout
	$FallSFX.play()
	var new_bonk = BONK.instantiate()
	get_parent().add_child(new_bonk)
	new_bonk.global_position = $Person.global_position + Vector2(0,50)
	new_bonk.reset_physics_interpolation()

func create_wiggle() -> void:
	var new_wiggle = WIGGLE.instantiate()
	get_parent().add_child(new_wiggle)
	new_wiggle.global_position = $Person.global_position + Vector2(0,-100)
	new_wiggle.reset_physics_interpolation()

func create_coins() -> void:
	var pos = $Person.global_position + Vector2(-150,-300)
	var v = 20
	for i in range(15):
		var new_coin = COIN_VFX.instantiate()
		get_parent().add_child(new_coin)
		new_coin.global_position = pos
		new_coin.reset_physics_interpolation()
		pos.x += 30
		pos.y += v
		v *= -1
		await get_tree().create_timer(0.1).timeout
		


func _on_action_button_button_down() -> void:
	#Start the countdown
	if $Timer.is_stopped():
		$StartTimeSFX.play()
		$Person/GPUParticles2D.emitting = false
		near = false
		$CanvasLayer/VBoxContainer/TimeLabel.text = "Wait one second!"
		$Person.play("Standing")
		$Timer.start()
		$Chair/ChairChanger.change_chair()
		$Chair.reset_physics_interpolation()
	#Stop the timer
	else:
		$ChairStopSFX.play()
		if $Timer.time_left > 1.001:
			if $Timer.time_left < 1.01:
				$Person.play("Uncomfortable")
				$CanvasLayer/CoinCounter.refresh_coin_count(2)
				near = true
				$UncomfortableSitSFX.play()
				create_wiggle()
			else: create_bonk()
			$CanvasLayer/VBoxContainer/TimeLabel.text = str(snapped($Timer.time_left - 1,0.0001)) + " seconds early"
		elif $Timer.time_left < 0.999:
			if $Timer.time_left > 0.99:
				$Person.play("Uncomfortable")
				$CanvasLayer/CoinCounter.refresh_coin_count(2)
				near = true
				$UncomfortableSitSFX.play()
				create_wiggle()
			else: create_bonk()
			$CanvasLayer/VBoxContainer/TimeLabel.text = str(snapped(1 - $Timer.time_left,0.0001)) + " seconds late"
		else:
			$Person.play("Perfect")
			$PerfectSitSFX.play()
			create_coins()
			$Person/GPUParticles2D.emitting = true
			$CanvasLayer/VBoxContainer/TimeLabel.text = "P E R F E C T\n + 80 coins"
			get_node("./CanvasLayer/CoinCounter").refresh_coin_count(80)
		if near:
			$CanvasLayer/VBoxContainer/TimeLabel.text += "\n +2 coins"
			var new_coin = COIN_VFX.instantiate()
			get_parent().add_child(new_coin)
			new_coin.global_position = $Person.global_position + Vector2(0,-300)
			new_coin.reset_physics_interpolation()
		$Timer.stop()
		$Chair.reset_physics_interpolation()
