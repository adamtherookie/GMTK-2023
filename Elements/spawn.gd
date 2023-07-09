extends Node2D

@export var enemy : PackedScene

@export var max_enemies = 10
@export var delay = 1.0

var enemies = 0

func _ready():
	$Timer.wait_time = delay

func _physics_process(delta):
	if enemies < max_enemies:
		if $Timer.is_stopped():
			var e = enemy.instantiate()
			e.position = global_position
			owner.add_child(e)

			enemies += 1
			
			$Timer.start()
