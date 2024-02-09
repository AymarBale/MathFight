extends Node2D


var num = RandomNumberGenerator.new()
onready var i = $Label
onready var tween = $Tween

export (Vector2) var final_scale = Vector2(0.825,0.825)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)#PRESSUREVector2(0.4,0.825)#STARTVector2(0.1,0.1)
export (Vector2) var pressure_scale =  Vector2(0.4,0.825)
export (Vector2) var soft_scale = Vector2(0.825,0.825)
export (float) var duration = 0.5


func spawn():
	num.randomize()
	var number = num.randi_range(1,10)
	$Label.text = str(number)
	pass


func j():
	spawn()
	tween.interpolate_property(self,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(self,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$Pressure_timer.start()
	
func lo():
	tween.interpolate_property(self,"scale", soft_scale, pressure_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(self,"scale", pressure_scale, soft_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	faze_out()
	pass 

func faze_out():
	$Tween.interpolate_property(i, 'modulate', Color(1, 1, 1, 1),Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	pass

func _on_Pressure_timer_timeout():
	lo()
	pass # Replace with function body.

