extends Area2D

@export var speed = 800

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		return

	queue_free()

	if body.is_in_group("enemies") or body.is_in_group("friends"):
		body.hits -= 1
	
	if body.is_in_group("asteroids"):
		body.split()
