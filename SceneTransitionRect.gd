extends ColorRect

@export var next_scene_path : String
@onready var _anim_player = $AnimationPlayer

func _ready():
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene := next_scene_path) -> void:
	_anim_player.play("Fade")
	get_tree().change_scene_to_file(_next_scene)
