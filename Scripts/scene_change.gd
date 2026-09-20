extends Button

@export var scene_name: String

func _ready() -> void:
	button_up.connect(changeScene)
	mouse_entered.connect(make_hover_sound)

func changeScene() -> void:
	SceneTransitionEffect.play_click_sound()
	if check_all_done() && Global.first_time_completed:
		Global.first_time_completed = false
		Global.save_game()
		SceneTransitionEffect.inAnim("outro_scene")
	else:
		SceneTransitionEffect.inAnim(scene_name)

func check_all_done() -> bool:
	var completed = true
	for chair in Global.chairs:
		if chair == false: completed = false
	return completed

func make_hover_sound() -> void:
	SceneTransitionEffect.play_hover_sound()
