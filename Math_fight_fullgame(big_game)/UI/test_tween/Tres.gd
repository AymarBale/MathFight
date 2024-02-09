extends Node2D

signal fight

export (Vector2) var final_scale = Vector2(0.325,0.325)#Vector2(1,2)Y#Vector2(3,1)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)
export (float) var duration = 0.5


onready var i = $Tres
onready var tween = $Tween
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func jab():
	$one.play()
	i.position.y += 1
	$Tres.show()
	tween.interpolate_property(i, "position",i.position, Vector2(0, 155), 1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(i,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(i,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	hide()
	emit_signal("fight")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Dos_tres():
	jab()
	pass # Replace with function body.


func _on_one_finished():
	$one.queue_free()
	pass # Replace with function body.
