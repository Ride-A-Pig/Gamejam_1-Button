extends Control

onready var obj = get_node("/root/Control")

var final_time:int

func _ready():
	final_time = obj.time;
	$Label.bbcode_text = "[center]\n\n\nYou spent [color=red]%d[/color] seconds\nto turn off the computer!\n[color=green]Press SpaceBar to Restart[/color][/center]"%final_time



func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
