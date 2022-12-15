extends window_base

onready var path_follow = $NinePatchRect/ColorRect/Path2D/PathFollow2D
onready var color_rect = $NinePatchRect/ColorRect
onready var animation_player = $NinePatchRect/ColorRect/AnimationPlayer


var start:float
var bar_range = 0.3
var trigger = false

func _init():
	seed(Time.get_unix_time_from_system())
	randomize()
	start = rand_range(0,.7)

func _process(_delta):
	color_rect.material.set_shader_param("start",start)
	color_rect.material.set_shader_param("end",start+bar_range)
	if active and !trigger:
		trigger = true
		animation_player.play("Loop")

	
func pressed():
	if(path_follow.unit_offset>=start and path_follow.unit_offset<=start+bar_range):
		close()
	else:
		popup()
