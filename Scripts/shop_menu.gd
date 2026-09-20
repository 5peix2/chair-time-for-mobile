extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_all_boxes()

func check_all_boxes() -> void:
	Global.save_game()
	$VBoxContainer/HBoxContainer/VBoxContainer/Normal.check_chairs_available()
	$VBoxContainer/HBoxContainer/VBoxContainer2/Uncommon.check_chairs_available()
	$VBoxContainer/HBoxContainer3/VBoxContainer3/Special.check_chairs_available()
	$VBoxContainer/HBoxContainer3/VBoxContainer4/Epic.check_chairs_available()
	$VBoxContainer/HBoxContainer2/VBoxContainer/Random.check_chairs_available()
	$VBoxContainer/HBoxContainer2/VBoxContainer2/New.check_chairs_available()
