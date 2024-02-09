extends Node2D

signal over

onready var i = $Sprite
onready var tween = $Tween

export (Vector2) var final_scale = Vector2(0.925,0.925)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)#PRESSUREVector2(0.4,0.825)#STARTVector2(0.1,0.1)
export (Vector2) var pressure_scale =  Vector2(0.4,0.825)
export (Vector2) var soft_scale = Vector2(0.925,0.925)
export (float) var duration = 0.5


# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	tween.interpolate_property(self,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(self,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$Pressure_timer.start()
	$Ready.play()
	
func lo():
	tween.interpolate_property(self,"scale", soft_scale, pressure_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(self,"scale", pressure_scale, soft_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	$disappear_timer.start()
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		_ready()
	if Input.is_action_pressed("ui_up"):
		lo()
	pass


func _on_Pressure_timer_timeout():
	lo()
	pass # Replace with function body.


func _on_disappear_timer_timeout():
	hide()
	emit_signal("over")
	$Ready.queue_free()
	pass # Replace with function body.
