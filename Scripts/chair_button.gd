extends Button

const CHAIR_CARD = preload("res://Scenes/chair_card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_up.connect(show_card)
	mouse_entered.connect(play_hover_effect)
	if !Global.chairs[get_id()]:
		disabled = true
		icon = load("res://Sprites/chairs2/Blocked.tres")
		modulate = Color(0.487, 0.328, 0.042, 0.75)

func show_card() -> void:
	SceneTransitionEffect.play_click_sound()
	var new_card = CHAIR_CARD.instantiate()
	get_node("../../../..").add_child(new_card)
	new_card.ID = get_id()

func get_id() -> int:
	var parts = name.split("_")
	return parts[-1].to_int()

func play_hover_effect() -> void:
	if !disabled: SceneTransitionEffect.play_hover_sound()
