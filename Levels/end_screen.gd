extends Node2D

func _ready():
	$Label.text = "Well done, Commander. You have successfully stopped the invasion.\nIn total, you've defended " + str($Global.asteroids) + " asteroids."
