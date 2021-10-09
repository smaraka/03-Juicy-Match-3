extends Node2D

var c = 0

func _ready():
	$Tween.interpolate_property(self, "scale", Vector2(0,0), Vector2(1,1), 0.25, Tween.TRANS_EXPO,Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property(self, "global_position", global_position, Vector2(20,15), 0.75, Tween.TRANS_EXPO, Tween.EASE_IN, 0.25)
	$Tween.start()
	$Tween.interpolate_property(self, "scale", Vector2(1,1), Vector2(0.2,0.2), 0.5, Tween.TRANS_EXPO, Tween.EASE_IN, 0.25)
	$Tween.start()
	$Tween.interpolate_property(self, "modulate:a", 1.0, 0, 2.0, Tween.TRANS_EXPO, Tween.EASE_IN, 0.25)
	$Tween.start()
func _physics_process(_delta):
	$Highlight.modulate.a = (sin(c)/2)+0.5
	c += 0.5
