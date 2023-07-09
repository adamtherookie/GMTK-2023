extends Line2D

var point
@export var trail_length = 10
@export var target : Node2D

func _process(delta):
	if !is_instance_valid(target):
		queue_free()
	
	point = target.global_position
	add_point(point)
	
	while get_point_count() > trail_length:
		remove_point(0)
