extends Node2D

export (Vector2) var final_scale = Vector2(0.325,0.325)#Vector2(1,2)Y#Vector2(3,1)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)
export (float) var duration = 0.5

onready var i = $Dos
onready var tween = $Tween
signal tres
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func jab():
	
	$two.play()
	i.position.y += 1
	$Dos.show()
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
	emit_signal("tres")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Uno_dos():
	jab()
	pass # Replace with function body.


func _on_two_finished():
	$two.queue_free()
	pass # Replace with function body.
