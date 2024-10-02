extends Timer

@export var current_wave_number = 0
var wave_duration = 20  # Time before the next wave starts
var enemy_a= preload("res://scenes/enemy_a.tscn")
var enemy_b= preload("res://scenes/enemy_b.tscn")
var enemy_c= preload("res://scenes/enemy_c.tscn")
@onready var path = %Path2D
@onready var gapTimer: Timer= $gapTimer
func _ready():
	gapTimer.wait_time=wave_duration
	start_next_wave()

func start_next_wave():
	current_wave_number += 1
	if current_wave_number<=1:
		await spawn_enemies(10,enemy_b) 
		end_wave()
	elif current_wave_number<=5:
		await spawn_enemies(current_wave_number*10,enemy_b)
		end_wave()
	elif current_wave_number<=10:
		await spawn_enemies(10,enemy_b)
		await spawn_enemies(5,enemy_a)
		await spawn_enemies(10,enemy_b)
		end_wave()

func spawn_enemies(enemy_count:int,type:PackedScene):
	for i in range(enemy_count):
		var enemy = type.instantiate()
		path.add_child(enemy)
		self.start()
		await self.timeout

	

func end_wave():
	print("Wave ", current_wave_number, " completed!")
	# Use await with a Timer instance
	gapTimer.start()
	await gapTimer.timeout  # Wait for the timer to timeout
	start_next_wave()
