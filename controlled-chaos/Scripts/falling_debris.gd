extends Node2D

@export var speed = 160.0
var current_speed = 0.0

func _physics_process(delta):
	position.y += current_speed * delta
	
func _on_hitbox_area_entered(area):
	if area.get_parent() is Player:
		print("hitbox entered")
		area.get_parent().queue_free()
		get_tree().change_scene_to_file("res://Scenes/LoseScreen.tscn")


func _on_player_detect_area_entered(area):
	if area.get_parent() is Player:
		$AnimationPlayer.play("falling_anim")
		print("player detect entered")

func fall():
	print("currently falling")
	current_speed = speed
	await get_tree().create_timer(5).timeout
	queue_free()
