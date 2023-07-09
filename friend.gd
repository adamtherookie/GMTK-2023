extends CharacterBody2D

var enemies = []
var target = null
var speed = 200

var hits = 3

var bullet = preload("res://Elements/bullet.tscn")

@onready var explosion = get_parent().get_node("Global").explosion

var acceleration = 0.05
var friction = 0.01

func _ready():
	randomize()

func _physics_process(delta):
	if hits == 0:
		destroy()
	
	if target == null:
		chooseRandomTarget()

	if target != null:
		var direction = target.position - global_position

		look_at(target.position)

		if $Timer.is_stopped():
			var b = bullet.instantiate()
			get_parent().add_child(b)
			b.transform = $Marker2D.global_transform
			b.scale.x = 1
			b.scale.y = 1
			
			$Timer.start()
		
		if direction.length() > 100.0:
			velocity = lerp(velocity, direction.normalized() * speed, acceleration)
		else:
			velocity = lerp(velocity, Vector2.ZERO, friction)

	move_and_slide()

func chooseRandomTarget():
	enemies = get_tree().get_nodes_in_group("enemies")
	
	if enemies.size() > 0:
		target = enemies[randi() % enemies.size()]
	else:
		destroy()

func destroy():
	var ex = explosion.instantiate()
	ex.transform = global_transform
	get_parent().add_child(ex)
	
	queue_free()
