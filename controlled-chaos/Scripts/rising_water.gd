extends Area2D

func _process(delta):
	position.y -= delta * 40
	
func _on_area_entered(area):
	if area.get_parent() is Player:
		print("kill zone entered")
		area.get_parent().die()
		queue_free()
