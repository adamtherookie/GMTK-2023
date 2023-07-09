extends Node2D

@onready var tween = create_tween()

func _process(delta):
	if $HUD.get_node("Time").time >= 1:
		$Player.visible = true
		$Crosshair.visible = true
	
	if $HUD.get_node("Time").time >= 2:
		$Label.visible = true
	
	if $HUD.get_node("Time").time >= 4:
		$Label2.visible = true
	
	if $HUD.get_node("Time").time >= 8:
		$Enemy.visible = true
		$Label3.visible = true
	
	if $HUD.get_node("Time").time >= 10:
		$Friend.visible = true
		$Label4.visible = true
	
	if $HUD.get_node("Time").time >= 16:
		$Label.visible = false
		$Label2.visible = false
		$Enemy.visible = false
		$Label3.visible = false
		$Friend.visible = false
		$Label4.visible = false
	
	if $HUD.get_node("Time").time >= 17:
		$Label5.visible = true
	
	if $HUD.get_node("Time").time >= 35:
		$SceneTransitionRect.transition_to($SceneTransitionRect.next_scene_path)
	
