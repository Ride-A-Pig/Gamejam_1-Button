extends window_base


onready var timer = get_node("/root/Control/TimeLable/Timer")
onready var end = preload("res://Scenes/End.tscn").instance()
onready var audio_player = $AudioStreamPlayer



func pressed():
	timer.stop()
	visible = false
	audio_player.play()
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect,"modulate",Color(1,1,1,1),3)


func _on_AudioStreamPlayer_finished():
	close()
	get_node("/root/Control").add_child(end)
