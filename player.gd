extends CharacterBody2D

var speed = 400
var acceleration = 0.05
var friction = 0.01

@export var bullet : PackedScene

func _physics_process(delta):
	var screensize = get_viewport_rect().size
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = lerp(velocity, direction * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2(0, 0), friction)
	
	if Input.is_action_pressed("shoot") and $Timer.is_stopped():
		$AudioStreamPlayer.play()
		var b = bullet.instantiate()
		b.transform = global_transform
		b.look_at(get_global_mouse_position())
		b.scale.x = 1
		b.scale.y = 1
		get_parent().add_child(b)

		$Timer.start()
	
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	move_and_slide()
