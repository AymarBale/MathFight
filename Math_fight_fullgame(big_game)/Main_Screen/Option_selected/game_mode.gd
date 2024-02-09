extends Node2D

signal gamemode

onready var tween = $Tween
onready var m_tween = $mode/tween_mode
onready var ban = $banner
onready var choose = $banner/letters/c
onready var a = $banner/letters/a
onready var mode = $banner/letters/m
onready var tournoit = $mode/tournament
onready var arcade = $mode/arcade
onready var training = $mode/training

var banner_pos = Vector2(508.39,116.311)#Vector2(516,166)
var banner_original_pos = Vector2(516,-56.49)
var choose_ori_pos = Vector2(-175.46,-334.12)
var a_ori_pos = Vector2(14.919,-348.92)
var m_ori_pos = Vector2(248.411,-358.57)
var choose_pos = Vector2(-127.13,-14.126) 
var a_pos = Vector2(21.586,-13.928)
var mode_pos = Vector2(151.74,-6.912)

var t_ori_pos = Vector2(330.39,1011.2)
var arc_ori_pos = Vector2(427.06,952.96)
var train_ori_pos =  Vector2(755.13,921.83)

func _ready():
	ban.position = banner_original_pos
	choose.position = choose_ori_pos 
	a.position = a_ori_pos
	mode.position = m_ori_pos
	tournoit.position = t_ori_pos
	arcade.position = arc_ori_pos
	training.position = train_ori_pos
	
	pass

func start():
	_ready()
	banner()
	mode()


func banner():
	tween.interpolate_property(ban, "position",banner_original_pos, banner_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)#ban.position
	tween.start()
	yield(tween,"tween_completed")
	letters()
	pass

func letters():
	tween.interpolate_property(choose, "position",choose_ori_pos, choose_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	$sound/letters_swicht_sound.play()
	yield(tween,"tween_completed")
	tween.interpolate_property(a, "position",a_ori_pos, a_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	$sound/letters_swicht_sound.play()
	yield(tween,"tween_completed")
	tween.interpolate_property(mode, "position",m_ori_pos, mode_pos,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	$sound/letters_swicht_sound.play()
	pass

func mode():
	m_tween.interpolate_property(tournoit, "position",t_ori_pos, $mode/t_pos.position,2,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	m_tween.start()
	$sound/game_swicht_sound.play()
	yield(tween,"tween_completed")
	m_tween.interpolate_property(arcade, "position",arc_ori_pos, $mode/a_pos.position,2,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	m_tween.start()
	$sound/game_swicht_sound.play()
	yield(tween,"tween_completed")
	m_tween.interpolate_property(training, "position",t_ori_pos, $mode/train_pos.position,2,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	m_tween.start()
	$sound/game_swicht_sound.play()
	pass



func _on_Game_mode_pressed():
	emit_signal("gamemode")
	get_parent().get_node("Fighter/Swipe_detector").fighter_mode = 0
	show()
	start()
	pass # Replace with function body.
