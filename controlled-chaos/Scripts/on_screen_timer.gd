extends Node2D

@onready var label = $Label
@onready var time = $Timer
@onready var total_time_seconds : int = 0

func _ready():
	$Timer.start()
	


func _on_timer_timeout():
	print(total_time_seconds)
	total_time_seconds += 1
	var m = int(total_time_seconds/60)
	var s = total_time_seconds - m * 60
	
	$Label.text = '%02d:%02d' % [m, s]
