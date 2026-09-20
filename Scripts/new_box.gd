extends Button

@export var price: int

const CHAIR_CARD = preload("res://Scenes/chair_card.tscn")
const BOX_ANIM = preload("res://Scenes/box_open_anim.tscn")

func _on_button_up() -> void:
	SceneTransitionEffect.play_click_sound()
	get_node("../../../../CoinCounter").refresh_coin_count(-price)
	var blocked_chairs = []
	var i = 0
	#Get an array of all the blocked chairs
	for chair in Global.chairs:
		if chair == false:
			blocked_chairs.append(i)
		i += 1
	var r = randi() % blocked_chairs.size()
	r = blocked_chairs[r]
	
	var new_box = BOX_ANIM.instantiate()
	get_node("../../../..").add_child(new_box)
	new_box.setBoxColor(modulate)
	await get_tree().create_timer(3.5,false).timeout
	
	var new_chair = CHAIR_CARD.instantiate()
	get_node("../../../..").add_child(new_chair)
	new_chair.ID = r
	if !Global.chairs[r]: new_chair.set_new()
	Global.chairs[r] = true
	get_node("../../../..").check_all_boxes()

func check_chairs_available() -> void:
	var found = false
	for chair in Global.chairs:
		if chair == false:
			found = true
			break
	if !found:
		disabled = true
		text = "COMPLETE!"
	if Global.coins < price: disabled = true
	
func _ready() -> void:
	get_node("../Price").text = str(price)
	mouse_entered.connect(play_hover_sound)

func play_hover_sound() -> void:
	if !disabled: SceneTransitionEffect.play_hover_sound()
