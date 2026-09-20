extends AnimatedSprite2D

var mouse_pos: Vector2
var prev_pos: Vector2
var state: String = "normal"
var prev_state = ""

const BONK = preload("res://Scenes/bonk_vfx.tscn")
const COIN_VFX = preload("res://Scenes/coin_vfx.tscn")

@export var max_imp: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		await get_tree().create_timer(10,false).timeout
		$ChairChanger.change_chair()

func _process(delta: float) -> void:
	mouse_pos.x = get_global_mouse_position().x
	global_position.x = mouse_pos.x
	
	if prev_pos.x > global_position.x:
		state = "left"
	elif prev_pos.x < global_position.x:
		state = "right"
	else:
		state = "normal"
	prev_pos = global_position
	
	if prev_state != state: tilt_anim()
	prev_state = state

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.begins_with("Ball"):
		SceneTransitionEffect.playBallSound()
		var new_bonk = BONK.instantiate()
		get_parent().add_child(new_bonk)
		new_bonk.global_position = global_position + Vector2(0,-50)
		new_bonk.reset_physics_interpolation()
		var coin_vfx = COIN_VFX.instantiate()
		get_parent().add_child(coin_vfx)
		coin_vfx.global_position = global_position + Vector2(0,-200)
		coin_vfx.reset_physics_interpolation()
		get_node("../../CanvasLayer/CoinCounter").refresh_coin_count(1)
		body.linear_velocity = Vector2(0,0)
		var ang = randi() % 20 + 5
		var x_imp = randi() % max_imp + max_imp / 2.0
		var r = randi() % 2
		if r == 0:
			x_imp *= -1
			ang *= -1
		var y_imp = randi() % max_imp + max_imp / 2.0
		body.apply_impulse(Vector2(x_imp,-y_imp))
		body.angular_velocity = ang
		

func tilt_anim() -> void:
	var tween = get_tree().create_tween()
	var new_r
	match state:
		"normal": new_r = 0
		"left": new_r = -20
		"right": new_r = 20
	tween.tween_property(self,"rotation_degrees",new_r,0.2).set_trans(Tween.TRANS_SINE)
	
