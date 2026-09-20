extends Node2D

const COIN = preload("res://Scenes/coin.tscn")
const BOMB = preload("res://Scenes/bumper.tscn")

var bombCount: int = 4

@export var spawn_time: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		create_coin()
		await get_tree().create_timer(spawn_time).timeout

func create_coin() -> void:
	var spawn_pos = Vector2(-1100,(randi()%1000 - 300))
	var l = randi()%2
	if l == 0: spawn_pos.y *= -1
	spawn_pos.y -= 300
	var new_coin = COIN.instantiate()
	new_coin.direction = Vector2(1,0)
	new_coin.speed = randi()%200 + 100
	get_parent().add_child.call_deferred(new_coin)
	new_coin.global_position = spawn_pos
	new_coin.reset_physics_interpolation()
	
	
	bombCount -= 1
	if bombCount == 0:
		bombCount = 4
		var bomb_spawn_pos = spawn_pos + Vector2(0,-100)
		var new_bomb = BOMB.instantiate()
		new_bomb.direction = Vector2(1,0)
		get_parent().add_child.call_deferred(new_bomb)
		new_bomb.global_position = bomb_spawn_pos
	
