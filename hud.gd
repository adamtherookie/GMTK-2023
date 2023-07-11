extends Node2D

var asteroids = []
var enemies = []
var allies = []
var time = 0.0

func _process(delta):
	time += delta
	asteroids = get_tree().get_nodes_in_group("asteroids")
	enemies = get_tree().get_nodes_in_group("enemies")
	allies = get_tree().get_nodes_in_group("friends")
	
	var sum = 0
	for asteroid in asteroids:
		if asteroid.is_in_group("big"):
			sum += 3
		elif asteroid.is_in_group("medium"):
			sum += 2
		else:
			sum += 1
	
	$Asteroids.text = "Asteroids: " + str(sum)
	$Enemies.text = "Enemies: " + str(enemies.size())
	$Allies.text = "Allies: " + str(allies.size())
	
	if asteroids.size() == 0 and $Timer.is_stopped:
		get_tree().change_scene_to_file("res://Levels/lose.tscn")
	
	if enemies.size() == 0:
		get_parent().get_node("Win").visible = true
		get_parent().get_node("Win").text = "Wave defeated. Successfully defended " + str(sum) + " asteroids. Well done, Commander."
		
		if get_parent().get_node("SceneTransitionRect").next_scene_path != "res://Levels/end_screen.tscn":
				get_parent().get_node("Win").text += "\nPrepare for the next wave."
		
		await get_tree().create_timer(7).timeout
		get_parent().get_node("SceneTransitionRect").transition_to(get_parent().get_node("SceneTransitionRect").next_scene_path)
		
		set_physics_process(false)
		Global.asteroids += sum
		Global.time += time
