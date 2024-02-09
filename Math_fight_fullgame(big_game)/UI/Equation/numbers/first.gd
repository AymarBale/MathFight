extends Node2D


export (Vector2) var final_scale =  Vector2(1.5,1.5)
export (Vector2) var previous_scale =  Vector2(1,1)
export (float) var float_distance = 100
export (float) var duration = 0.25


func pop():
	$First.show()
	$tween.interpolate_property(self,"scale", scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	$tween.start()


func fade_in():
	$tween.interpolate_property(self,"position",position,position+Vector2(0, -float_distance),duration, 
	Tween.TRANS_BACK,Tween.EASE_IN)
	var transparent = modulate
	transparent.a = 0.0
	$tween.interpolate_property(self,"modulate",modulate,transparent,
	duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$tween.start()
	yield($tween,"tween_completed")
	$tween.reset_all()
	queue_free()


