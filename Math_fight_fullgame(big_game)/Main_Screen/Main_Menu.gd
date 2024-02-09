extends Node2D
onready var transition 
onready var g_transition 
export (float) var duration = 0.25
onready var tween 
onready var g_tween 
onready var arcade_touch = get_node("Option_selected/gamemode/mode/arcade/Arcade_Button")
var t = load('res://Tutorial/Tutorial_sign.tscn')

func _ready():
	Global.previous = Global.tutorial_done
	setter()
	#slow_load()
	if Global.tutorial_done == 0 :
		var tutorial = t.instance()
		add_child(tutorial)
	if Global.tutorial_done != 0 :
		pass
	yield(get_tree().create_timer(0.2),"timeout")
	$Option_selected/gamemode.start()
	$Sound/sound_timer.start()
	pass # Replace with function body.

func setter():
	transition = $Option_selected/f_transition
	yield(get_tree().create_timer(0.1),"timeout")
	g_transition = $Option_selected/g_transition
	yield(get_tree().create_timer(0.1),"timeout")
	tween = $Option_selected/f_transition/Tween
	yield(get_tree().create_timer(0.1),"timeout")
	g_tween = $Option_selected/g_transition/g_tween
	yield(get_tree().create_timer(0.1),"timeout")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Money_bar/icon_golden_pass2/Label.text = str(Global.money)
	if Global.sound == false :
		$Sound/music.playing = false
	pass


func _on_Fighter_transit():
	$Option_selected/f_transition.show()
	$Option_selected/f_transition.play()
	pass # Replace with function body.


func _on_f_transition_animation_finished():
	yield(get_tree().create_timer(0.5),"timeout")
	var transparent = modulate
	transparent.a = 0.0
	tween.interpolate_property(transition,"modulate",modulate,transparent,
	duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween,"tween_completed")
	$Option_selected/f_transition.hide()
	transition.modulate = Color(1, 1, 1, 1)
	$Option_selected/f_transition.stop()
	$Option_selected/f_transition.frame = 0
	pass


func _on_Option_fighter():
	$Option_selected/gamemode.hide()
	pass 


func _on_gamemode_gamemode():
	$Option_selected/Fighter.hide()
	$Option_selected/g_transition.play()
	pass 


func _on_g_transition_animation_finished():
	yield(get_tree().create_timer(0.5),"timeout")
	var transparent = modulate
	transparent.a = 0.0
	g_tween.interpolate_property(g_transition,"modulate",modulate,transparent,
	duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	g_tween.start()
	yield(g_tween,"tween_completed")
	$Option_selected/g_transition.hide()
	g_transition.modulate = Color(1, 1, 1, 1)
	$Option_selected/g_transition.stop()
	$Option_selected/g_transition.frame = 0
	pass # Replace with function body.


func _on_Tournament_Button_pressed():
	get_tree().change_scene("res://Gamemodes/tournament/tournament .tscn")
	pass # Replace with function body.


func _on_Arcade_Button_pressed():
	$Sound/music.stop()
	get_tree().change_scene("res://Gamemodes/arcades/Arcade.tscn")
	queue_free()
	pass # Replace with function body.


func _on_Training_Button_pressed():
	get_tree().change_scene("res://Gamemodes/training_ground/training_ground.tscn")
	pass # Replace with function body.



func _on_Exit_Button_pressed():
	Global.save_xp()
	Global.save_character()
	Global.save_score()
	Global.save_unlock_lv2()
	Global.save_unlock_lv3()
	Global.save_unlock_lv4()
	Global.save_unlock_lv5()
	Global.save_unlock_lv6()
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().quit()
	pass # Replace with function body.


func _on_tutorial_pressed():
	$tutorial/tutorial_sound.play()
	get_tree().change_scene('res://Tutorial/Tutorial.tscn')
	pass # Replace with function body.


func _on_sound_timer_timeout():
	$Sound/music.play()
	pass # Replace with function body.


func _on_mute_pressed():
	if Global.sound :
		Global.sound = false
		$Sound/music.playing = false
		return
	if Global.sound == false :
		$Sound/music.playing = true
		Global.sound = true
	pass # Replace with function body.



