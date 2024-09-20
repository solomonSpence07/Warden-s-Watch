extends Area2D


func _on_body_entered(body:Node2D):
	if body.name=="SkeletonBody":
		body.get_parent().turn_down()
