extends PathFollow2D

@onready var animated_sprite_2d = $SkeletonBody/AnimatedSprite2D

@export var speed =100

func _process(delta):
	#set_progess(get_parent().get_progress() + speed*delta)
	progress+= speed*delta


func turn_down():
	animated_sprite_2d.play("Down")

func turn_right():
	animated_sprite_2d.play("left_right")
	animated_sprite_2d.scale.x= 1
	
func turn_left():
	animated_sprite_2d.scale.x= -1
	animated_sprite_2d.play("left_right")