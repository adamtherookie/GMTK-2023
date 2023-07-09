extends RigidBody2D

var allowed = 1
var screensize = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width")
, ProjectSettings.get_setting("display/window/size/viewport_height")
)
var type = 3

@onready var big = get_parent().get_node("Global").big
@onready var medium = get_parent().get_node("Global").medium
@onready var small = get_parent().get_node("Global").small
@onready var explosion = get_parent().get_node("Global").explosion

func _ready():
	set_velocity()
	
	if is_in_group("big"):
		type = 3
	if is_in_group("medium"):
		type = 2
	if is_in_group("small"):
		type = 1

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if global_position.x < 0 or global_position.x > screensize.x:
		linear_velocity.x *= -1
	if global_position.y < 0 or global_position.y > screensize.y:
		linear_velocity.y *= -1

	move_and_collide(linear_velocity)

func set_velocity():
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	
	var ang = randf_range(- 2 * PI, 2 * PI)
	
	angular_velocity = ang
	linear_velocity = direction * 2

func _on_visible_on_screen_enabler_2d_screen_entered():
	allowed = 0

func split():
	if type > 1:
		type -= 1
		
		if type == 2:
			var a1 = medium.instantiate()
			var a2 = medium.instantiate()
			
			a1.global_transform = global_transform
			a2.global_transform = global_transform
			
			get_parent().add_child(a1)
			get_parent().add_child(a2)
		if type == 1:
			var a1 = small.instantiate()
			var a2 = small.instantiate()
			
			a1.global_transform = global_transform
			a2.global_transform = global_transform
			
			get_parent().add_child(a1)
			get_parent().add_child(a2)
		
		destroy()
	else:
		destroy()

func destroy():
	var ex = explosion.instantiate()
	ex.transform = global_transform
	get_parent().add_child(ex)
	
	queue_free()
