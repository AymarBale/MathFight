extends Node2D

export (Vector2) var final_scale =  Vector2(1.5,1.5)
export (float) var float_distance = 100
export (float) var duration = 0.25

func _ready():
	pop()

func pop():
	$tween.interpolate_property(self,"scale", scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	$tween.start()
	yield($tween,"tween_completed")
	$AnimationPlayer.play("Mad")
	$disappear_timer.start()


func lo():
	$tween.interpolate_property(self,"position",position,position+Vector2(0, -float_distance),duration, 
	Tween.TRANS_BACK,Tween.EASE_IN)
	var transparent = modulate
	transparent.a = 0.0
	$tween.interpolate_property(self,"modulate",modulate,transparent,
	duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$tween.start()
	yield($tween,"tween_completed")
	queue_free()


func _on_disappear_timer_timeout():
	lo()