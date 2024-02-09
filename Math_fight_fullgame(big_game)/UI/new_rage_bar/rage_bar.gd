extends Node2D

onready var i = $mood
onready var v = $R_bar/TextureProgress.value
onready var bar = $R_bar/TextureProgress
onready var tween = $Tween

var angry = Vector2(255,102)
var pissed = Vector2(255,212)
var happy = Vector2(255,268)

signal rage_full

func _start():
	v = 0
	$R_bar/Pissed_timer.start()
	$mood.position = happy
	pass

func _on_Pissed_timer_timeout():
	tween.interpolate_property(bar,"value",0,43, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	$mood.play("pissed")
	yield($Tween,"tween_completed")
	tween.interpolate_property(i, "position",i.position, pissed, 1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	#$R_bar/Angry_timer.start()
	pass # Replace with function body.


func _on_Angry_timer_timeout():
	tween.interpolate_property(bar,"value",43,90, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	$mood.play("angry")
	yield($Tween,"tween_completed")
	tween.interpolate_property(i, "position",i.position, angry, 1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	pass # Replace with function body.


func _on_Destruction_timer_timeout():
	tween.interpolate_property(bar,"value",90,140, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(i, "position",angry, Vector2(260.50,24), 1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$R_bar/Full_bar.show()
	$R_bar/TextureProgress.hide()
	emit_signal("rage_full")
	$mad_sound.play()
	Global.rage_full = 1
	Global.e_damage = Global.e_damage*2
	yield(get_tree().create_timer(2),'timeout')
	empty()
	pass # Replace with function body.


func _on_UI_rage():
	if Global.rage_Level == 1:
		$R_bar/Pissed_timer.start()
	if Global.rage_Level == 2:
		$R_bar/Angry_timer.start()
	if Global.rage_Level == 3:
		$R_bar/Destruction_timer.start()
	if Global.rage_Level == 0:
		$R_bar/Happy_timer.start()
		pass
	pass # Replace with function body.


func _on_Happy_timer_timeout():
	tween.interpolate_property(bar,"value",v,0, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	$mood.play("happy")
	yield($Tween,"tween_completed")
	tween.interpolate_property(i, "position",i.position, happy, 1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	pass # Replace with function body.


func empty():
	tween.interpolate_property(bar,"value",140,0, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(i, "position",Vector2(260.50,24), happy, 1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$R_bar/Full_bar.hide()
	$R_bar/TextureProgress.show()
	$mood.play("happy")
	$mood.position = happy
	v = 0
	Global.rage_full = 0
	Global.rage_Level = 0
	pass
