extends Node2D


onready var i = $MasterBoard
onready var tween = $Tween
export (Vector2) var pressure_scale =  Vector2(0.750,0.825)
export (Vector2) var soft_scale = Vector2(0.925,0.925)
export (float) var duration = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _on_Pressure_Timer_timeout():
	tween.interpolate_property(self,"scale", soft_scale, pressure_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$bounce_sound.play()
	tween.interpolate_property(self,"scale", pressure_scale, soft_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	pass # Replace with function body.
