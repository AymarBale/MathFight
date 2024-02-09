extends Node2D
var x = load("res://Main_Screen/Main_Menu.tscn")
export(float) var scrolling_speed = 250


func _ready():
	$AdMob.load_banner()
	$AdMob.show_banner()
	$Sound_game/music.play()
	slow_load()
	if Global.already_in >= 1 :
		_on_Press_to_play_pressed()
		$title/Press_to_play.hide()
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x += scrolling_speed *delta 
	$Label.text = str(Global.tutorial_done)
	pass


func _on_Press_to_play_pressed():
	$warning.hide()
	$Sound_game/button_sound.play()
	$AdMob.hide_banner()
	get_tree().change_scene("res://Main_Screen/Main_Menu.tscn")
	Global.already_in += 1
	pass # Replace with function body.


func _on_title_music_stop():
	$Sound_game/music.stop()
	pass # Replace with function body.


func slow_load():
	Global.aguerri()
	Global.setup()
	yield(get_tree().create_timer(0.1),"timeout")
	Global.unlock_setup_lv2()
	yield(get_tree().create_timer(0.1),"timeout")
	Global.unlock_setup_lv3()
	yield(get_tree().create_timer(0.1),"timeout")
	Global.unlock_setup_lv4()
	yield(get_tree().create_timer(0.1),"timeout")
	Global.unlock_setup_lv5()
	yield(get_tree().create_timer(0.1),"timeout")
	Global.unlock_setup_lv6()
	yield(get_tree().create_timer(0.1),"timeout")
	Global.character_setup()
