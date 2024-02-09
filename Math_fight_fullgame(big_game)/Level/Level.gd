extends Node2D
var r = load("res://Level/Ready_fight/Ready.tscn")
var n = load("res://UI/test_tween/clean_tween_number.tscn")
var z = load("res://Level/Ready_fight/Fight.tscn")



func _ready():
	intro()
	background()
	Engine.target_fps = 45
	pass

func background():
	if Global.background == 1 :
		$Background/BG_level1.show()
		$Background/BG_level2.hide()
		$Background/BG_level3.hide()
		$Background/BG_level4.hide()
		$Background/BG_level5.hide()
		$Background/BG_level6.hide()
		pass
	if Global.background == 2 :
		$Background/BG_level1.hide()
		$Background/BG_level2.show()
		$Background/BG_level3.hide()
		$Background/BG_level4.hide()
		$Background/BG_level5.hide()
		$Background/BG_level6.hide()
		pass
	if Global.background == 3 :
		$Background/BG_level1.hide()
		$Background/BG_level2.hide()
		$Background/BG_level3.show()
		$Background/BG_level4.hide()
		$Background/BG_level5.hide()
		$Background/BG_level6.hide()
		pass
	if Global.background == 4 :
		$Background/BG_level1.hide()
		$Background/BG_level2.hide()
		$Background/BG_level3.hide()
		$Background/BG_level4.show()
		$Background/BG_level5.hide()
		$Background/BG_level6.hide()
		pass
	if Global.background == 5 :
		$Background/BG_level1.hide()
		$Background/BG_level2.hide()
		$Background/BG_level3.hide()
		$Background/BG_level4.hide()
		$Background/BG_level5.show()
		$Background/BG_level6.hide()
		pass
	if Global.background == 6 :
		$Background/BG_level1.hide()
		$Background/BG_level2.hide()
		$Background/BG_level3.hide()
		$Background/BG_level4.hide()
		$Background/BG_level5.hide()
		$Background/BG_level6.show()
		pass
	pass


func intro():
	var ready = r.instance()
	add_child(ready)
	var countdown = n.instance()
	add_child(countdown)
	countdown.connect("fighting",self,"time_to_fight")
	pass

func time_to_fight():
	var fight = z.instance()
	add_child(fight)
	fight.connect("over",self,"ui_come_in_screen")
	pass

func ui_come_in_screen():
	$UI.come_in_screen()
	$Music_manager/ui_come_in_place.play()



func _on_UI_double_check():
	yield(get_tree().create_timer(0.8),"timeout")
	if Global.p_health <= 0:
		$Music_manager/Bell_Sound.play()
		$UI.queue_free()#hide()
		$Character.queue_free()#hide()
		#SceneChanger.goto_scene("res://Character/Win_or_loose/Win_Loser_Annoucement.tscn",self)
		get_tree().change_scene("res://Character/Win_or_loose/Win_Loser_Annoucement.tscn")
		queue_free()
	if Global.e_health <= 0:
		$Music_manager/Bell_Sound.play()
		$UI.queue_free()#hide()
		$Character.queue_free()#hide()
		#SceneChanger.goto_scene("res://Character/Win_or_loose/Win_Loser_Annoucement.tscn",self)
		get_tree().change_scene("res://Character/Win_or_loose/Win_Loser_Annoucement.tscn")
		level_unlock()
		queue_free()
	pass 

func level_unlock():
	if Global.background == 1:
		Global.level2_unlock = 1 
	if Global.background == 2:
		Global.level3_unlock = 1
	if Global.background == 3:
		Global.level4_unlock = 1
	if Global.background == 4:
		Global.level5_unlock = 1
	if Global.background == 5:
		Global.level6_unlock = 1
	pass
