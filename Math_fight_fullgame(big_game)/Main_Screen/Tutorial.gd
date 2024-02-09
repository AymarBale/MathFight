extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tween = $Tween 

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.menu_tuto == 0:
		yield(get_tree().create_timer(3), "timeout")
		get_parent().arcade_touch.hide()
		tween.interpolate_property($bord, "position",$bord.position,Vector2(531,274),1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func arcade():
	get_parent().arcade_touch.show()
	pass


func _on_no_released():
	$bord.queue_free()
	get_parent().arcade_touch.show()
	Global.menu_tuto = 1
	pass # Replace with function body.


func _on_yes_released():
	Global.menu_tuto = 1
	$Menu_tuto.show()
	$bord.hide()
	pass # Replace with function body.
