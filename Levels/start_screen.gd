extends Node2D

func _on_button_pressed():
	$Play.play()
	await get_tree().create_timer(1).timeout
	$SceneTransitionRect.transition_to($SceneTransitionRect.next_scene_path)
