extends Node2D

const COIN = preload("res://Scenes/coin.tscn")
const BUMPER = preload("res://Scenes/bumper_2.tscn")

var bumper_count: int = 10

@export var spawn_time: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		create_coin()
		await get_tree().create_timer(spawn_time).timeout

func create_coin() -> void:
	var spawn_pos = Vector2((randi()%900),-600)
	if randi() % 2 == 0: spawn_pos.x *= -1 #50/50 probaility to be negative (left half of the screen)
	
	bumper_count -= 1
	if bumper_count == 0:
		bumper_count = 10
		var new_bumper = BUMPER.instantiate()
		new_bumper.direction = Vector2(0,1)
		new_bumper.speed = randi() % 200 + 50
		get_parent().add_child.call_deferred(new_bumper)
		new_bumper.global_position = spawn_pos
	else:
		var new_coin = COIN.instantiate()
		new_coin.direction = Vector2(0,1)
		new_coin.speed = randi() % 200 + 50
		get_parent().add_child.call_deferred(new_coin)
		new_coin.global_position = spawn_pos
