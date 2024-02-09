extends Node2D

onready var tween 
onready var tween_b 
onready var stats_tween 
onready var character 
onready var stat 
onready var p_bar 
onready var checkmark 
var warning = load('res://Main_Screen/window/window.tscn')

signal transit
var m = 1
var x = 0
var bought = {"Mathieux": false, "Vince": false, "Brook": false,'Fernando':false,'Devo':false}

func fighter():
	hide()
	$Select_button/Select_button/Label.text = str("SELECT")
	yield(get_tree().create_timer(0.2),"timeout")
	setter()
	if $Swipe_detector.fighter_mode == -1 :
		$Swipe_detector.fighter_mode = 0

func setter():
	tween = $Character/Tween_character
	tween_b = $Player_bar/Tween_bar
	stats_tween = $player_stats/stats_tween
	character = $Character
	stat = $player_stats
	p_bar = $Player_bar
	checkmark = $checkmark
	stats()
	pass

func _on_right_pressed():
	if  m < 6:
		var f = character.position - Vector2(324.06,0)
		var s = p_bar.position - Vector2(129,0)
		tween.interpolate_property(character, "position",character.position,f ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		tween_b.interpolate_property(p_bar, "position",p_bar.position,s,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween_b.start()
		m += 1
		$Arrow/Arrow_right/ar_right_sound.play()
		get_node("Arrow/Arrow_right/right").visible = false
		yield(get_tree().create_timer(3),"timeout")
		get_node("Arrow/Arrow_right/right").visible = true


func _on_left_pressed():
		if character.position != Vector2(0,0) :
			var f = character.position + Vector2(324.06,0)
			var s = p_bar.position + Vector2(129,0)
			tween.interpolate_property(character, "position",character.position,f ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
			tween.start()
			tween_b.interpolate_property(p_bar, "position",p_bar.position,s,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
			tween_b.start()
			m -= 1
			get_node("Arrow/Arrow_left/left").visible = false
			yield(get_tree().create_timer(3),"timeout")
			get_node("Arrow/Arrow_left/left").visible = true

func check_character():
	if m == 1 :
		character_selection()
	if m == 2 && Global.level2_unlock == 1 :
		$Character/mathieux/lock.hide()
		character_selection()
	if m == 3 && Global.level3_unlock == 1 :
		$Character/vince/lock2.hide()
		character_selection()
	if m == 4 && Global.level4_unlock == 1 :
		$Character/brook/lock3.hide()
		character_selection()
	if m == 5 && Global.level5_unlock == 1 :
		$Character/fernando/lock4.hide()
		character_selection()
	if m == 6 && Global.level6_unlock == 1 :
		$Character/devo/lock5.hide()
		character_selection()
		pass
	pass

func character_selection():
	if x == 0 : 
		selected()
	if x == 1 : 
		unselected()
	pass

func _on_Select_button_pressed():
	$Swipe_detector.fighter_mode = -1
	$Select_button/select_button_sound.play()
	if m == 1 :
		check_character()
	if m == 2:
		if bought["Mathieux"]:
			check_character()
		if (bought["Mathieux"] == false):
			buying_time()
	if m == 3:
		if bought["Vince"]:
			check_character()
		if (bought["Vince"] == false):
			buying_time()
			pass
	if m == 4:
		if bought["Brook"]:
			check_character()
		if (bought["Brook"] == false):
			buying_time()
			pass
	if m == 5:
		if bought['Fernando']:
			check_character()
		if (bought['Fernando'] == false):
			buying_time()
			pass
	if m == 6:
		if bought['Devo']:
			check_character()
		if (bought['Devo'] == false):
			buying_time()
			pass
	get_node("Select_button/Select_button").visible = false
	yield(get_tree().create_timer(1),"timeout")
	get_node("Select_button/Select_button").visible = true
	
	pass # Replace with function body.

func buying_time():
	if m == 2:
		if Global.Mathieux == 1:
			check_character()
			pass
		if Global.Mathieux < 1:
			if Global.money > 200  :
				Global.money -= 200
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought["Mathieux"] = true
				Global.Mathieux = 1
				return
			if Global.money == 200:
				Global.money -= 200
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought["Mathieux"] = true
				Global.Mathieux = 1
				return
			if Global.money < 200 :
				var j = warning.instance()
				add_child(j)
				j.w = 'not enough money'
		
		pass
	if m == 3:
		if Global.Vince == 1:
			check_character()
		if Global.Vince < 1:
			if Global.money > 400 :
				Global.money -= 400
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought["Vince"] = true
				Global.Vince = 1
				return
			if Global.money == 400 :
				Global.money -= 400
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought["Vince"] = true
				Global.Vince = 1
				return
			if Global.money < 400 :
				var j = warning.instance()
				add_child(j)
				j.w = 'not enough money'
				pass
		pass
	if m == 4:
		if Global.Brook == 1:
			check_character()
		if Global.Brook < 1:
			if Global.money > 600 :
				Global.money -= 600
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought["Brook"] = true
				Global.Brook = 1
				return
			if Global.money == 600 :
				Global.money -= 600
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought["Brook"] = true
				Global.Brook = 1
				return
			if Global.money < 600 :
				var j = warning.instance()
				add_child(j)
				j.w = 'not enough money'
				pass
		pass
	if m == 5:
		if Global.Fernando == 1:
			check_character()
			pass
		if Global.Fernando < 1:
			if Global.money > 800 :
				Global.money -= 800
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought['Fernando'] = true
				Global.Fernando = 1
				return
			if Global.money == 800 :
				Global.money -= 800
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought['Fernando'] = true
				Global.Fernando = 1
				return
				pass
			if Global.money < 800 :
				var j = warning.instance()
				add_child(j)
				j.w = 'not enough money'
				return
				pass
		pass
	if m == 6:
		if Global.Devo == 1:
			check_character()
			pass
		if Global.Devo < 1:
			if Global.money > 1000 :
				Global.money -= 1000
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought['Devo'] = true
				Global.Devo = 1
				return
			if Global.money == 1000 :
				Global.money -= 1000
				check_character()
				yield(get_tree().create_timer(0.5),"timeout")
				bought['Devo'] = true
				Global.Devo = 1
				return
			if Global.money < 1000 :
				var j = warning.instance()
				add_child(j)
				j.w = 'not enough money'
			pass
		pass
	pass

func selected():
	checkmark.show()
	$Arrow.hide()
	var f = character.position - Vector2(150,0)
	var z = stat.position - Vector2(450,0)
	tween.interpolate_property(character, "position",character.position,f ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	stats_tween.interpolate_property(stat, "position",stat.position,z ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	stats_tween.start()
	$Select_button/Select_button/Label.text = str("UNSELECT")
	yield(get_tree().create_timer(0.5),"timeout")
	x = 1
	Global.p_skin = m 
	#$Swipe_detector.fighter_mode = -1
	pass

func unselected():
	checkmark.hide()
	$Arrow.show()
	var f = character.position + Vector2(150,0)
	var z = stat.position + Vector2(450,0)
	tween.interpolate_property(character, "position",character.position,f ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	stats_tween.interpolate_property(stat, "position",stat.position,z ,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	stats_tween.start()
	$Select_button/Select_button/Label.text = str("SELECT")
	x = 0
	Global.p_skin = 0 
	yield(get_tree().create_timer(1),"timeout")
	$Swipe_detector.fighter_mode = 1
	pass

func _on_Fighter_button_pressed():
	fighter()
	emit_signal("transit")
	yield(get_tree().create_timer(1.2),"timeout")
	show()
	$Swipe_detector.fighter_mode = 1 
	pass # Replace with function body.

func _process(delta):
	$player_stats/stat_board/Attack/stat_level_attack.text = str($player_stats/stat_board/Attack/TextureProgress.value)
	$player_stats/stat_board/stat_level_health.text = str($player_stats/stat_board/Health/TextureProgress.value)
	if Global.level2_unlock == 1 :
		$Character/mathieux/lock.hide()
		$Character/mathieux/icon_golden_pass.show()
	if Global.level3_unlock == 1:
		$Character/vince/lock2.hide()
		$Character/vince/icon_golden_pass2.show()
	if Global.level4_unlock == 1:
		$Character/brook/lock3.hide()
		$Character/brook/icon_golden_pass3.show()
	if Global.level5_unlock == 1:
		$Character/fernando/lock4.hide()
		$Character/fernando/icon_golden_pass4.show()
	if Global.level6_unlock == 1:
		$Character/devo/lock5.hide()
		$Character/devo/icon_golden_pass5.show()
	yield(get_tree().create_timer(0.1),"timeout")
	


func stats():
	if m == 1:
		$player_stats/stat_board/Attack/TextureProgress.value = 4
		$player_stats/stat_board/Health/TextureProgress.value = 8
		pass
	if m == 2:
		$player_stats/stat_board/Attack/TextureProgress.value = 4
		$player_stats/stat_board/Health/TextureProgress.value = 12
		pass
	if m == 3:
		$player_stats/stat_board/Attack/TextureProgress.value = 5
		$player_stats/stat_board/Health/TextureProgress.value = 16
		pass
	if m == 4:
		$player_stats/stat_board/Attack/TextureProgress.value = 6
		$player_stats/stat_board/Health/TextureProgress.value = 25
		pass
	if m == 5:
		$player_stats/stat_board/Attack/TextureProgress.value = 8
		$player_stats/stat_board/Health/TextureProgress.value = 36
		pass
	if m == 6:
		$player_stats/stat_board/Attack/TextureProgress.value = 9
		$player_stats/stat_board/Health/TextureProgress.value = 56
		pass
	pass

func loader():
	if Global.Mathieux == 0:
		bought["Mathieux"] = false
	if Global.Mathieux == 1 :
		bought["Mathieux"] = true
	if Global.Vince == 0 :
		bought["Vince"] = false
	if Global.Vince == 1 :
		bought["Vince"] = true
	if Global.Brook == 0 :
		bought["Brook"] = false
	if Global.Brook == 1 :
		bought["Brook"] = true
	if Global.Fernando == 0:
		bought["Fernando"] = false
	if Global.Fernando == 1:
		bought["Fernando"] = true
	if Global.Devo == 0:
		bought["Devo"] = false
	if Global.Devo == 1:
		bought["Devo"] = true


func _on_Swipe_detector_swipe_negatif():
	_on_left_pressed()
	pass # Replace with function body.


func _on_Swipe_detector_swipe_positif():
	_on_right_pressed()
	pass # Replace with function body.
