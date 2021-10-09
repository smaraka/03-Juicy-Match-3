extends Control



func _ready():
	var _changed = Global.connect("changed",self,"_on_score_changed")
	var time_changed = Global.connect("time_changed",self,"_on_time_changed")
	_on_score_changed()
	$Instructions.show()
	get_tree().paused = true

func _on_score_changed():
	
	$Score.text = str(Global.score)

func _on_time_changed():
	
	$Time.text = "Time: " + str(Global.time)


func _on_Timer_timeout():
	Global.change_time()
