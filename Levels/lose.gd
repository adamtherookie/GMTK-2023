extends Node2D

func _ready():
	$Label.text = "The perimeter has been breached.\nReturn to base immediately.\nThe humans are on their way.\nWe need...[Transmission Interrupted]"

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level1.tscn")
