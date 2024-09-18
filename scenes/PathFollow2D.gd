extends PathFollow2D


@export var speed =100

func _process(delta):
	#set_progess(get_parent().get_progress() + speed*delta)
	progress+= speed*delta