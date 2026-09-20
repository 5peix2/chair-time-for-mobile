extends Button

var presses = 5
@export var reset_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_up() -> void:
	SceneTransitionEffect.play_click_sound()
	presses -= 1
	if presses == 0:
		Global.chairs.fill(false)
		Global.chairs[0] = true
		Global.coins = 0
		Global.first_time_completed = true
		Global.rainbow_active = false
		Global.save_game()
		SceneTransitionEffect.inAnim("intro_scene")
	else:
		reset_label.text = "Click " + str(presses) + " times to reset"
	


func _on_mouse_entered() -> void:
	SceneTransitionEffect.play_hover_sound()
