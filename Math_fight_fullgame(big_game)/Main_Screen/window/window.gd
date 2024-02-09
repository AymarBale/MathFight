extends Node2D
onready var window = $Sprite 
onready var tween = $Tween
onready var f = $final_pos.position 
onready var o = $ori_pos.position
signal safe_to_pursue
var w
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.5),"timeout")
	come_in_frames()
	$Sprite/warning_message.text = str(w)
	pass # Replace with function body.

func come_in_frames():
	tween.interpolate_property(window, "position",o,f ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_TouchScreenButton_pressed():
	queue_free()
	emit_signal('safe_to_pursue')
	pass # Replace with function body.
