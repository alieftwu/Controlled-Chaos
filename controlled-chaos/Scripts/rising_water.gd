extends Area2D

func _process(delta):
	position.y -= delta * 40
	
func _on_area_entered(area):
	if area.get_parent() is Player:
		print("kill zone entered")
		area.get_parent().queue_free()
		get_tree().change_scene_to_file("res://Scenes/LoseScreen.tscn")
		
