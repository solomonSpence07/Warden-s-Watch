extends PathFollow2D
class_name Enemy

@export var characterBody2D :CharacterBody2D
@export var speed :float=50
@export var health =1
@export var speed_multiplier:float = 1
func _process(delta):
	progress+= speed*delta*speed_multiplier
	if Input.is_action_just_pressed("ui_text_backspace"):
		takeDamage(1)


func turn_down():
	characterBody2D.get_child(1).play("Down")

func turn_right():
	characterBody2D.get_child(1).play("left_right")
	characterBody2D.get_child(1).scale.x= 1
	
func turn_left():
	characterBody2D.get_child(1).scale.x= -1
	characterBody2D.get_child(1).play("left_right")

func takeDamage(amount):
	health-=amount
	if health<=0:
		queue_free()
	print (health)
