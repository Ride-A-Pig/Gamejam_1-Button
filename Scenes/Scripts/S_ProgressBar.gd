extends window_base

onready var progress_bar = $NinePatchRect/ProgressBar
onready var audio_stream_player = $AudioStreamPlayer


func _ready():
	progress_bar.value = 0

func pressed():
	progress_bar.value += 12
	audio_stream_player.play()
	if progress_bar.value >= 100:
		close()
