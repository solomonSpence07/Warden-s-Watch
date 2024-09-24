extends Enemy


@export var min_speed = 100  
@export var speed_multiplier = 1.5  

func _process(delta):
    # speed is based on the health
    var health_ratio = health / 10.0  
    speed = min_speed + (1 - health_ratio) * (min_speed * speed_multiplier)

    progress += speed * delta



