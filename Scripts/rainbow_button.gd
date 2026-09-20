extends Button

const rainbow_material = preload("res://Shaders/rainbow.tres")
var rainbow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if check_all_done(): visible = true
	else: visible = false
	rainbow = Global.rainbow_active
	update_rainbow()
	mouse_entered.connect(make_hover_sound)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_all_done() -> bool:
	var completed = true
	for chair in Global.chairs:
		if chair == false: completed = false
	return completed

func _on_button_up() -> void:
	SceneTransitionEffect.play_click_sound()
	rainbow = !rainbow
	Global.rainbow_active = rainbow
	Global.save_game()
	update_rainbow()

func update_rainbow() -> void:
	if rainbow:
		material = rainbow_material
		text = "!"
	else:
		material = null
		text = "?"

func make_hover_sound() -> void:
	SceneTransitionEffect.play_hover_sound()
