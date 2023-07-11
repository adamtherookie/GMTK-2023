extends Node2D

func _ready():
	var time = Global.time
	var minutes = time / 60
	var seconds = fmod(time, 60)
	var milliseconds := fmod(time, 1) * 100
	var time_string := "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	$Label.text = "Well done, Commander. You have successfully stopped the invasion.\nIn total, you've defended " + str(Global.asteroids) + " asteroids. You took " + time_string + "."
