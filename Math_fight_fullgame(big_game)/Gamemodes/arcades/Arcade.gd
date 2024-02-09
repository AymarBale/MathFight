extends Node2D
var level_final = Vector2(0,0)
var level_init = Vector2(866,0)
onready var level = $Level
onready var l_tween = $level_Tween
onready var t = $board/Tween
export(float) var scrolling_speed = 250


func _ready():
	board()
	$Sound/music.play()
	yield(get_tree().create_timer(0.5),"timeout")
	$Transition.play()
	level.position = level_init
	yield(get_tree().create_timer(0.5),"timeout")
	level_intro()
	pass

func level_intro():
	l_tween.interpolate_property(level, "position",level_init,level_final ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	l_tween.start()
	$Sound/swicht.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.sound == false :
		$Sound/music.playing = false
	$Money_bar/Sprite/Label.text = str(Global.money)
	$ParallaxBackground.scroll_offset.x += scrolling_speed *delta
	pass


func _on_Go_back_button_pressed():
	$Sound/music.stop()
	get_tree().change_scene("res://Main_Screen/Main_Menu.tscn")
	pass # Replace with function body.
	

func board():
	if Global.tutorial_done == 0 :
		t.interpolate_property($board, "position",$board.position,Vector2(43.8,581.2) ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		t.start()
		$Level.safety_on()
	pass


func _on_yes_pressed():
	SceneChanger.goto_scene("res://Game_tutorial/Game_tutorial.tscn",self)
	$board.queue_free()
	pass # Replace with function body.


func _on_no_pressed():
	Global.tutorial_done += 1
	$board.queue_free()
	$Level.safety_off()
	pass # Replace with function body.

func sound_off():
	$Sound/music.stop()
	pass
