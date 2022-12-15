extends window_base

onready var timer = $NinePatchRect/Time/Timer
onready var time = $NinePatchRect/Time

var time_left:float = 1
var trigger = false

func _ready():
	set_timer_text(time_left)

func pressed():
	close()

func _process(_delta):
	if active and !trigger:
		trigger = true
		timer.start()


func _on_Timer_timeout():
	time_left-=timer.wait_time;
	time.text = str(time_left)
	if time_left<=0:
		popup()
		timer.stop()
		time_left = 1
		set_timer_text(time_left)
		trigger = false
		
func set_timer_text(var arg):
	time.text = str("%.1f" % arg)
