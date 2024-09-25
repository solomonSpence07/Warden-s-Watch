extends Enemy

var maxHealth=health
func _ready():
    print("sasd")
@export var speed_multiplier = 1.5  


    
func _process(delta):
    super._process(delta)
    var health_ratio = health / maxHealth 
    speed = health_ratio/speed
