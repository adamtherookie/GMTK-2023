extends Node2D

@export var speed_factor = 3

@export var big : PackedScene
@export var medium : PackedScene
@export var small : PackedScene

@export var explosion : PackedScene

var asteroids = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
