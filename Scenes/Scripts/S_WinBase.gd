extends Node2D
class_name window_base

export var active = false
export(NodePath) var next_window_path

onready var next_window = get_node_or_null(next_window_path)
onready var layer = get_node("/root/Control/PopupLayer")
onready var sound_player = get_node("/root/Control/SoundPlayer")

var popup_list = [
	"res://Scenes/Popups/AccurateBar.tscn", 
	"res://Scenes/Popups/NoYes.tscn", 
	"res://Scenes/Popups/ProgressBar.tscn", 
	"res://Scenes/Popups/YesNo.tscn"
	]

func _input(event):
	if event.is_action_pressed("ui_accept") and active:
		pressed()
		
func pressed():
	pass

func close():
	sound_player.stream = load("res://src/SFX/SFX_Popup.wav")
	sound_player.play()
	visible = false;
	active = false;
	yield(get_tree(),"idle_frame")
	if next_window:
		next_window.active = true
	queue_free()
		
func popup():
	sound_player.stream = load("res://src/SFX/SFX_Error.mp3")
	sound_player.play()
	var temp = load(popup_list[randi()%popup_list.size()]).instance()
	active = false
	temp.active = true
	temp.next_window_path = self.get_path()
	temp.position = Vector2(rand_range(0,100),rand_range(0,50))
	layer.add_child(temp)
