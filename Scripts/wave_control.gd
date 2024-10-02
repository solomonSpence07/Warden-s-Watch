extends Node2D 


var current_wave_number = 0
var wave_duration = 5.0  # Time before the next wave starts
var enemy_a= preload("res://scenes/enemy_a.tscn")
var enemy_b= preload("res://scenes/enemy_b.tscn")
var enemy_c= preload("res://scenes/enemy_c.tscn")
@onready var path = %Path2D
@onready var wave_timer: Timer = $waveTimer

func _ready():
	start_next_wave()

func start_next_wave():
	current_wave_number += 1
	spawn_enemies(current_wave_number,enemy_a)

func spawn_enemies(enemy_count:int,type:PackedScene):
	for i in range(enemy_count):
		var enemy = type.instantiate()
		path.add_child(enemy)
		wave_timer.start()
		await wave_timer.timeout

	# Use await with a Timer instance
	var timer = Timer.new()
	timer.wait_time = wave_duration
	timer.one_shot = true
	add_child(timer)
	timer.start()
	await timer.timeout  # Wait for the timer to timeout
	end_wave()

func end_wave():
	print("Wave ", current_wave_number, " completed!")
	start_next_wave()
