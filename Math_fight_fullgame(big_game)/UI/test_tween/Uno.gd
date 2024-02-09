extends Node2D

onready var i = $Uno
onready var tween = $Tween

export (Vector2) var final_scale = Vector2(0.325,0.325)#Vector2(1,2)Y#Vector2(3,1)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)
export (float) var duration = 0.5
signal dos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	$Timer.start()
	pass

# Called when the node enters the scene tree for the first time.
func _countdown():
	$trois.play()
	i.scale = Vector2(0.1,0.1)
	i.position.y += 1
	$Uno.show()
	tween.interpolate_property(i, "position",i.position, Vector2(0, 155),1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(i,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(i,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	hide()
	emit_signal("dos")
	pass # Replace with function body.




func _on_Timer_timeout():
	_countdown()
	pass # Replace with function body.


func _on_trois_finished():
	$trois.queue_free()
	pass # Replace with function body.
