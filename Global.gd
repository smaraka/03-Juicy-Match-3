extends Node

var score = 0
var time = 0

var level = 1

var levelOneEnd = 60
var levelTwoEnd = 2000

var levelOneScore = 0
var levelTwoTime = 0


signal changed
signal time_changed

var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}

func _ready():
	randomize()
	if level == 1:
		time = levelOneEnd

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()

func change_score(s):
	var camera = get_node_or_null("/root/Game/Camera")
	if camera:
		camera.add_trauma(0.5)
	score += s
	if level == 2:
		if score >= levelTwoEnd:
			levelTwoTime = time
			get_tree().change_scene("res://UI/Endgame.tscn")
	emit_signal("changed")
	
func change_time():
	if level == 1:
		time -= 1
		if time <= 0:
			levelOneScore = score
			level = 2
			time = 0
			score = 0
			get_tree().change_scene("res://Game2.tscn")
	else:
		time += 1
	emit_signal("time_changed")

