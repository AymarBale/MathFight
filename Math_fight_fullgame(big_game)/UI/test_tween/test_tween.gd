extends Node2D
onready var i = $one
onready var tween = $Tween

export (Vector2) var final_scale = Vector2(1,2)#Vector2(3,3)#Vector2(1,2)Y#Vector2(3,1)
export (Vector2) var previous_scale =  Vector2(1,1)
export (float) var duration = 0.5

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		tween.interpolate_property(self,"scale", scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
		tween.start()
		yield($Tween,"tween_completed")
		tween.interpolate_property(self,"scale", scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
		tween.start()
		pass
