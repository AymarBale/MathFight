 extends Node2D

var x = 0
var winner = Vector2(273,160)
var loser = Vector2(684,152)
var p_skin 
var e_skin

export (Vector2) var final_scale = Vector2(0.485,0.584)
export (Vector2) var crown_scale = Vector2(0.28,0.28)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)
export (Vector2) var pressure_scale =  Vector2(0.4,0.28)
export (Vector2) var soft_scale = Vector2(0.28,0.28)
export (float) var duration = 0.5
export(float) var scrolling_speed = 250

onready var tween = $Tween
onready var tween2 = $Tween2
onready var tween3 = $Tween3
onready var w = $winner
onready var l = $loser
onready var c = $crown

func _ready():
	Engine.target_fps = 60
	p_skin()
	e_skin()
	e_skin.play("idle")
	p_skin.play("idle")
	$crown.hide()
	$winner.hide()
	$loser.hide()
	$confetti.hide()
	$Decision_Timer.start()
	$add.hide()
	$add/AdMob.load_rewarded_video()
	yield(get_tree().create_timer(1.0), "timeout")
	$add.show()
	pass



func _on_Decision_Timer_timeout():
	if Global.winner :
		$Cheering_sound.play()
		$Winner_sound.play()
		e_skin.play("loose")
		p_skin.play("winner")
		$winner.position = Vector2(273.752,160.25)
		$loser.position = Vector2(684.028,161.356)
		$crown.position = Vector2(268.478,77.239)
		$confetti.position = Vector2(0,0)
	if Global.looser:
		$disappointed_crowd.play()
		$Loser_sound.play()
		e_skin.play("winner")
		p_skin.play("loose")
		yield(p_skin,"animation_finished")
		$winner.position = Vector2(684.028,161.356)
		$loser.position = Vector2(273.752,160.25)
		$crown.position = Vector2(674.344,75.411)
		$confetti.position = Vector2(417.19,0)
	call_winner()
	call_loser()
	play_confetti()
	call_crown()
	$crown.show()
	$winner.show()
	$loser.show()
	$confetti.show()
	pass

func call_winner():
	$winner.show()
	tween.interpolate_property(w,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(w,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	pass

func call_loser():
	$loser.show()
	tween2.interpolate_property(l,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween2.start()
	yield($Tween,"tween_completed")
	tween2.interpolate_property(l,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween2.start()
	yield($Tween,"tween_completed")
	pass

func play_confetti():
	$confetti.show()
	$confetti/confetti_sound.play()
	$confetti/one.play()
	$confetti/two.play()
	$confetti/three.play()
	$confetti/four.play()
	$confetti/five.play()
	pass

func call_crown():
	c.show()
	$Tween.interpolate_property(c, 'modulate', Color(1, 1, 1, 0),Color(1, 1, 1, 1), 0.3, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	$crown/pressure_timer.start()
	pass


func _on_pressure_timer_timeout():
	tween.interpolate_property(c,"scale", soft_scale, pressure_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(c,"scale", pressure_scale, soft_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	pass # Replace with function body.


func _on_one_animation_finished():
	$confetti/confetti_sound.play()
	pass # Replace with function body.


func _on_Button_pressed():
	Global.looser = false
	queue_free()
	get_tree().change_scene("res://Gamemodes/arcades/Arcade.tscn")
	pass # Replace with function body.

func _process(delta):
	$Label.text = str(Global.money)
	$ParallaxBackground.scroll_offset.x += scrolling_speed *delta

func p_skin():
	if Global.p_skin == 1 :
		$p_skins/blake.show()
		p_skin = $p_skins/blake
		$p_skins/devo.hide()
		$p_skins/brook.hide()
		$p_skins/fernando.hide()
		$p_skins/mathieux.hide()
		$p_skins/vince.hide()
	if Global.p_skin == 2 :
		p_skin = $p_skins/mathieux
		$p_skins/mathieux.show()
		$p_skins/blake.hide()
		$p_skins/brook.hide()
		$p_skins/devo.hide()
		$p_skins/fernando.hide()
		$p_skins/vince.hide()
		pass
	if Global.p_skin == 3 :
		$p_skins/brook.show()
		p_skin = $p_skins/brook
		$p_skins/blake.hide()
		$p_skins/mathieux.hide()
		$p_skins/devo.hide()
		$p_skins/fernando.hide()
		$p_skins/vince.hide()
		pass
	if Global.p_skin == 4 :
		$p_skins/vince.show()
		p_skin = $p_skins/vince
		$p_skins/mathieux.hide()
		$p_skins/blake.hide()
		$p_skins/devo.hide()
		$p_skins/fernando.hide()
		$p_skins/brook.hide()
		pass
	if Global.p_skin == 5 :
		$p_skins/fernando.show()
		p_skin = $p_skins/fernando
		$p_skins/blake.hide()
		$p_skins/brook.hide()
		$p_skins/devo.hide()
		$p_skins/mathieux.hide()
		$p_skins/vince.hide()
		pass
	if Global.p_skin == 6 :
		$p_skins/devo.show()
		p_skin = $p_skins/devo
		$p_skins/blake.hide()
		$p_skins/brook.hide()
		$p_skins/fernando.hide()
		$p_skins/mathieux.hide()
		$p_skins/vince.hide()
		pass
	pass

func e_skin():
	if Global.e_skin == 1 :
		$e_skins/blake.show()
		e_skin = $e_skins/blake
		$e_skins/devo.hide()
		$e_skins/brook.hide()
		$e_skins/fernando.hide()
		$e_skins/mathieux.hide()
		$e_skins/vince.hide()
	if Global.e_skin == 2 :
		e_skin = $e_skins/mathieux
		$e_skins/mathieux.show()
		$e_skins/blake.hide()
		$e_skins/brook.hide()
		$e_skins/devo.hide()
		$e_skins/fernando.hide()
		$e_skins/vince.hide()
		pass
	if Global.e_skin == 3 :
		$e_skins/brook.show()
		e_skin = $e_skins/brook
		$e_skins/blake.hide()
		$e_skins/mathieux.hide()
		$e_skins/devo.hide()
		$e_skins/fernando.hide()
		$e_skins/vince.hide()
		pass
	if Global.e_skin == 4 :
		$e_skins/vince.show()
		e_skin = $e_skins/vince
		$e_skins/mathieux.hide()
		$e_skins/blake.hide()
		$e_skins/devo.hide()
		$e_skins/fernando.hide()
		$e_skins/brook.hide()
		pass
	if Global.e_skin == 5 :
		$e_skins/fernando.show()
		e_skin = $e_skins/fernando
		$e_skins/blake.hide()
		$e_skins/brook.hide()
		$e_skins/devo.hide()
		$e_skins/mathieux.hide()
		$e_skins/vince.hide()
		pass
	if Global.e_skin == 6 :
		$e_skins/devo.show()
		e_skin = $e_skins/devo
		$e_skins/blake.hide()
		$e_skins/brook.hide()
		$e_skins/fernando.hide()
		$e_skins/mathieux.hide()
		$e_skins/vince.hide()
	if Global.e_skin == 8 :
		e_skin = Global.t_skin 
	pass


func _on_TouchScreenButton_pressed():
	Global.looser = false
	get_tree().change_scene("res://Level/Level.tscn")
	pass # Replace with function body.


func _on_yes_pressed():
	$add/AdMob.show_rewarded_video()
	pass 


func _on_no_pressed():
	$add.queue_free()
	pass # Replace with function body.


func _on_AdMob_rewarded_video_closed():
	$add.queue_free()
	$add/ProgressBar.value += 1
	pass # Replace with function body.
