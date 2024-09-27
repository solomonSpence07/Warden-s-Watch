extends Enemy

var maxSpeedMultiplier=3
var maxHealth=health
func _ready():
	print("sasd")
	maxHealth=health



	
func _process(delta):
	super._process(delta)
	if health >0 :
		var health_ratio = maxHealth / health
		if health_ratio<=maxSpeedMultiplier :
			speed_multiplier=health_ratio
			print(speed_multiplier)