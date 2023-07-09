extends Label

var time = 0

func _process(delta):
	time += delta
	
	var minutes = time / 60
	var seconds = fmod(time, 60)
	var milliseconds := fmod(time, 1) * 100
	var time_string := "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	text = time_string
