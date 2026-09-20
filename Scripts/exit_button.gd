extends Button

func _on_button_up() -> void:
	get_tree().quit()




func _on_mouse_entered() -> void:
	SceneTransitionEffect.play_hover_sound()
