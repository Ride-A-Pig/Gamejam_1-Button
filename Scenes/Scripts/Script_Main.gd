extends Control

onready var timer = $TimeLable
var time:int = 0

func _input(event):
	if event.is_action_pressed("ui_accept") and get_node_or_null("ColorRect"):
		$ColorRect.queue_free()
		$TimeLable/Timer.start()
		$PopupLayer/Intro6.active = true
		$SoundPlayer.play()

func _on_Timer_timeout():
	time += 1
	timer.text = ("%02d"%(time/60)+":%02d"%(time%60))
