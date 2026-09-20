extends Node2D

var save_path = "user://save_game.dat"

var coins: int = 0

var first_time: bool = true
var first_time_completed: bool = true
var rainbow_active: bool = false
var volume_db = 0.0

#WELCOME TO THE WORLD OF CHAIRS!!!!
var chairs: Array = []

func _ready() -> void:
	chairs.resize(150) #Number of chairs
	chairs.fill(false) #All blocked
	chairs[0] = true #... Except the first one.
	load_game()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),volume_db)
	
	if first_time:
		first_time = false
		save_game()
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/intro_scene.tscn")

func change_coin_num(value: int) -> int:
	coins += value
	if coins > 99999: coins = 99999
	save_game()
	return coins

func save_game() -> void:
	var data = SaveData.new()
	data.coins = coins
	data.chairs = chairs
	data.first_time = first_time
	data.first_time_completed = first_time_completed
	data.rainbow_active = rainbow_active
	data.volume_db = volume_db
	ResourceSaver.save(data,"user://save.tres")

func load_game() -> void:
	if ResourceLoader.exists("user://save.tres"):
		var data = load("user://save.tres")
		chairs = data.chairs
		coins = data.coins
		first_time = data.first_time
		first_time_completed = data.first_time_completed
		rainbow_active = data.rainbow_active
		volume_db = data.volume_db
