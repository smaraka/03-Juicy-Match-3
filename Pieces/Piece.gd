extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2.ZERO

var Effects = null
var dying = false
var wiggle = 0.0
export var wiggle_amount = 3

export var transparent_time = 1.0
export var scale_time = 1.5
export var rot_time = 1.5

var wav1 = null

var wav3 = null

var Coin = preload("res://Coin/Coin.tscn")

func _ready():
	$Select.texture = $Sprite.texture
	$Select.scale = $Sprite.scale
	wiggle = randf()

func _physics_process(_delta):
	if dying and not $Tween.is_active():
		queue_free()
	elif position != target_position and not $Tween.is_active():
		position = target_position
	if selected:
		$Select.show()
		$Selected.emitting = true
	else:
		$Select.hide()
		$Selected.emitting = false
	wiggle += 0.1
	position.x = target_position.x + (sin(wiggle)*wiggle_amount)

func generate(pos):
	position = Vector2(pos.x,-100)
	target_position = pos
	$Tween.interpolate_property(self, "position", position, target_position, randf()+0.5, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Tween.start()
	if wav3 == null:
		wav3 = get_node_or_null("/root/Game/3")
	if wav3 != null:
		wav3.play()
func move_piece(change):
	if wav1 == null:
		wav1 = get_node_or_null("/root/Game/1")
	if wav1 != null:
		wav1.play()
	target_position = target_position + change


func die():
	dying = true;
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var coin = Coin.instance()
		coin.position = target_position
		Effects.add_child(coin)
	$Tween.interpolate_property(self, "modulate:a", 1, 0, transparent_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property(self, "scale", scale, Vector2(3,3), scale_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property($Sprite, "rotation",rotation, (randf()*4*PI)-2*PI, rot_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()





func _on_Timer_timeout():
	pass # Replace with function body.
