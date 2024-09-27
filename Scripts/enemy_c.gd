extends Enemy

var startingOpacity= 255.0
@export var target_opacity = 88
var is_invisible  = false
@export var invisible_duration = 3.0
@onready var invisibleTimer: Timer=$invisibleTimer
@onready var randomTimer: Timer=$randomTimer



func _ready() -> void:
	invisibleTimer.wait_time=invisible_duration
	random()

func _on_random_timer_timeout():
	modulate.a=target_opacity
	invisibleTimer.start()
	print("invisibleTimer")

func random():
	randomTimer.wait_time=randf_range(1,1)
	randomTimer.start()

func _on_invisible_timer_timeout():
	random()
	modulate.a=startingOpacity

func _process(delta):
	super._process(delta)
	print(modulate.a)