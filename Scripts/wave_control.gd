extends Label

@export var current_wave_number = 0
var enemy_a= preload("res://scenes/enemy_a.tscn")
var enemy_b= preload("res://scenes/enemy_b.tscn")
var enemy_c= preload("res://scenes/enemy_c.tscn")
@onready var path = %Path2D
@onready var gapTimer: Timer= $gapTimer
func _ready():
	
	pass

func start_next_wave():
	print(current_wave_number)
	current_wave_number += 1
	if current_wave_number<=1:
		spawn_enemies(10,enemy_b) 
		
	elif current_wave_number<=5:
		spawn_enemies(current_wave_number*5,enemy_b)
	
	elif current_wave_number<=10:
		await spawn_enemies(10,enemy_b)
		await spawn_enemies(5,enemy_a)
		spawn_enemies(10,enemy_b)

func spawn_enemies(enemy_count:int,type:PackedScene):
	for i in range(enemy_count):
		var enemy = type.instantiate()
		path.add_child(enemy)
		gapTimer.start()
		await gapTimer.timeout
	print("spawn")
	
func _process(delta):
	if Input.is_action_just_pressed("waveStart"):
		start_next_wave()
		print("button clicked")
