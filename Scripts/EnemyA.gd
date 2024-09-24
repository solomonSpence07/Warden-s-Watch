extends PathFollow2D
class_name Enemy

@export var characterBody2D :CharacterBody2D
@export var speed =50
@export var health =1

func _process(delta):
	#set_progess(get_parent().get_progress() + speed*delta)
	progress+= speed*delta


func turn_down():
	characterBody2D.get_child(1).play("Down")

func turn_right():
	characterBody2D.get_child(1).play("left_right")
	characterBody2D.get_child(1).scale.x= 1
	
func turn_left():
	characterBody2D.get_child(1).scale.x= -1
	characterBody2D.get_child(1).play("left_right")

