extends Area2D


func _on_body_entered(body:Node2D):
	if body.name=="SkeletonBody" or body.name=="slimeBody":
		body.get_parent().turn_down()
