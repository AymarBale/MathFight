extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pointer = false
var a = 0.1
onready var s = $Sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pointer()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += a
	$pointer_timer/Label.text = str($pointer_timer.time_left)

func pointer():
		$pointer_timer.start()
		pass


func _on_pointer_timer_timeout():
	if a == 0.1 :
		a = -0.1
		return
	if a == -0.1:
		a = 0.1
		return
	pass # Replace with function body.
