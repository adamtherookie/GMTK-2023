extends Node2D

func _ready():
	$Timer.start()
	$AudioStreamPlayer.play()

func _on_timer_timeout():
	queue_free()
