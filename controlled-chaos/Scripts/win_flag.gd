extends Node2D


func _on_win_area_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().queue_free()
		get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")
