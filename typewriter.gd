extends Label

@export var factor = 20

func _ready():
	visible_ratio = 0

func _process(delta):
	if visible:
		var tween = create_tween()
		tween.tween_property(self, "visible_ratio", 1.1, len(text) / factor)
		tween.set_trans(Tween.TRANS_SINE)
