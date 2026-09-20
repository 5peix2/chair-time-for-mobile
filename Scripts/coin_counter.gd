extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refresh_coin_count(0)

func refresh_coin_count(value: int) -> void:
	if value > 0:
		$AnimationPlayer.play("bounce")
		var r = randi()%5
		$MoneyGainSFX.pitch_scale = 1 + r * 0.1
		$MoneyGainSFX.play()
	elif value < 0:
		$MoneyLoseSFX.play()
		$AnimationPlayer.play("bounce_red")
	$Label.text = str(Global.change_coin_num(value))
