extends Control


func _ready():
	$Label.text = "Thanks for Playing!\n\nLevel 1 Score: " + str(Global.levelOneScore) + "\n\nLevel 2 Score: "  + str(Global.levelTwoTime)

func _on_Play_pressed():
	Global.score = 0
	Global.time =  Global.levelOneEnd
	Global.level = 1
	Global.levelOneScore = 0
	Global.levelTwoTime = 0
	get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
