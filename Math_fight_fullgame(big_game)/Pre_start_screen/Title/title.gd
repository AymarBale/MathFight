extends Node2D

var math_pos = Vector2(690.08,175.39)
var fight_pos = Vector2(430.38,311.12)
var ruler_pos = Vector2(496.77,296.65)

onready var m = $Math
onready var f = $Fight
onready var r = $Ruler
onready var b = $Press_to_play/unnamed


onready var tween = $Tween
onready var tween2 = $Tween2
onready var tween3 = $Ruler_tween
onready var tween4 = $Press_to_play/P_toplay_tween

export (Vector2) var pressure_scale =  Vector2(1.4,1.713)#Vector2(1,1)
export (Vector2) var soft_scale = Vector2(1.543,1.713)
export (float) var duration = 0.5

signal music_stop
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.already_in >= 1 :
		turn_logo_small()
	$Title_Timer.start()
	set_process(false)
	get_node("Press_to_play").visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	title_animals()
	if $bunny.position.x >= 670 :
		set_process(false)
		$bunny.set_speed_scale(0.5)
		$foxy.set_speed_scale(0.5)
		title_letters()
		ruler()
		$fluffy_timer.start()
		get_node("Press_to_play").visible = true
		$Press_to_play/Timer.start()
		pass
	pass


func title_animals():
	if $bunny.position.x != $Bunny_pos.position.x:
		$bunny.play("run")
		$bunny.position.x += 25
	if $foxy.position.x != $Foxy_pos.position.x:
		$foxy.play("run")
		$foxy.position.x -= 25
	pass

func title_letters():
	tween.interpolate_property(m, "position",m.position, math_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	tween2.interpolate_property(f, "position",f.position, fight_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween2.start()
	$swicht_fight.play()
	$swicht_math.play()
	yield(tween2,"tween_completed")
	$fire.show()
	$fire.play()
	pass

func ruler():
	tween.interpolate_property(r, "position",r.position, ruler_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	pass

func _on_lightning_animation_finished():
	set_process(true)
	pass # Replace with function body.


func _on_Title_Timer_timeout():
	$lightning.show()
	$lightning.play()
	$lightning/lighting_sound.play()
	pass # Replace with function body.

func fluffy():
	tween.interpolate_property(m,"scale", soft_scale, pressure_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	tween.interpolate_property(m,"scale", pressure_scale, soft_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	tween.interpolate_property(f,"scale", soft_scale, pressure_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	tween.interpolate_property(f,"scale", pressure_scale, soft_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$fluffy_timer.start()
	pass

func _on_fluffy_timer_timeout():
	fluffy()
	pass # Replace with function body.



func _on_Press_to_play_pressed():
	emit_signal("music_stop")
	turn_logo_small()
	pass # Replace with function body.


func _on_Timer_timeout():
	$Press_to_play/P_toplay_tween.interpolate_property(b, 'modulate', Color(1, 1, 1, 1),Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween4.start()
	#THEN REAPPEAR
	$Press_to_play/P_toplay_tween.interpolate_property(b, 'modulate', Color(1, 1, 1, 0),Color(1, 1, 1, 1), 0.3, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween4.start()
	$Press_to_play/Timer.start()
	pass # Replace with function body.

func turn_logo_small():
	scale = Vector2(0.3,0.3)
	var t_position = Vector2(140,440.49)
	tween.interpolate_property(self, "position",position, t_position,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	$Press_to_play.hide()
	


func _on_swicht_math_finished():
	$swicht_math.queue_free()
	pass # Replace with function body.


func _on_swicht_fight_finished():
	$swicht_fight.queue_free()
	pass # Replace with function body.
