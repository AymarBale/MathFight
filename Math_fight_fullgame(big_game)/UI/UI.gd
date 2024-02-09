extends Node2D
var equation = load("res://UI/Equation/Equation.tscn")
var clock = load("res://UI/final_clock/final_clock.tscn")
signal rage
signal double_check
onready var b = $Rage_bar/rage_bar
onready var i = $BM
onready var h = $Health_bars
onready var tween = $Tween
export (int) var duration = 1

var answer_left
var answer_right
var pause = 0
var w_s = 0
var already_done = false
var choice = 0

func _on_AttackButton_pressed(): 
	$BM/MasterBoard/Fighting_options/fight/AttackButton.visible = false
	stop_attack()
	if Global.rage_full == 0:
		$BM/MasterBoard/Fighting_options/fight/fight_button_sound.play()
		$Health_bars/Health_bar.enemy_life_decreased()
		Global.rage_Level += 1
		emit_signal("rage")
		w_s = 1
		Global.right = true
		Global.player_state = 4
		$BM/MasterBoard/Choosing_option/Left/pointing_arrow.set_process(true)
		$BM/MasterBoard/Choosing_option/Right/pointing_arrow.set_process(true)
		$BM/MasterBoard/Choosing_option/between_left/pointing_arrow.set_process(true)
	if Global.rage_full == 1 :
		$Health_bars/Health_bar.player_life_decreased()
		Global.right = false
		Global.enemy_state = 4
		already_done = true
		pass
	pass 

func stop_attack():
	yield(get_tree().create_timer(2),"timeout")
	$BM/MasterBoard/Fighting_options/fight/AttackButton.visible = true
	pass
func _ready():
	Global.rage_Level = 0
	get_node("Pause_button").visible = false
	get_node("exit_button").visible = false
	pass

func equation_caller():
	already_done = false
	var e = equation.instance()
	add_child(e)
	e.connect("over",self,"caller")
	e.connect("show_answer",self,"showanswer")
	e.position = $Equation/Equation_Position.position
	answer_left = e.z#str(e.z)
	answer_right = e.v#str(e.v)
	choice = e.inter_e


func showanswer():
	$Clock_for_equation/final_clock.showtime()
	if choice == 1 :
		$BM/MasterBoard/Choosing_option/Left/Left_Label.text = str(answer_left+choice)
		$BM/MasterBoard/Choosing_option/Right/Right_Label.text = str(answer_right)
		$BM/MasterBoard/Choosing_option/between_left/between_left_Label.text = str(answer_left)
	if choice == 2 :
		$BM/MasterBoard/Choosing_option/Left/Left_Label.text = str(answer_right)
		$BM/MasterBoard/Choosing_option/Right/Right_Label.text = str(answer_left)
		$BM/MasterBoard/Choosing_option/between_left/between_left_Label.text = str(answer_left + choice)
	if choice == 3:
		$BM/MasterBoard/Choosing_option/Left/Left_Label.text = str(answer_left)
		$BM/MasterBoard/Choosing_option/Right/Right_Label.text = str(answer_left + choice)
		$BM/MasterBoard/Choosing_option/between_left/between_left_Label.text = str(answer_right)
	pass

func caller():
	$BM/MasterBoard/Choosing_option/Left/pointing_arrow.set_process(true)
	$BM/MasterBoard/Choosing_option/Right/pointing_arrow.set_process(true)
	$BM/MasterBoard/Choosing_option/between_left/pointing_arrow.set_process(true)
	$BM/MasterBoard/Choosing_option/Left/Left_Label.text = str('')
	$BM/MasterBoard/Choosing_option/Right/Right_Label.text = str('')
	$BM/MasterBoard/Choosing_option/between_left/between_left_Label.text = str('')
	yield(get_tree().create_timer(0.5),"timeout")
	$"Equation/New equationTimer".start()
	$Clock_for_equation/final_clock.fill_up()


func _on_New_equationTimer_timeout():
	Global.unlocked_fighting_options = false
	if w_s == 0:
		wrong_or_slow()
	w_s = 0 
	$clapping.play()
	yield(get_tree().create_timer(3),"timeout")
	$clapping.stop()
	start()
	pass 

func wrong_or_slow():
	if (already_done == false):
		$Health_bars/Health_bar.player_life_decreased()
		Global.right = false
		Global.enemy_state = 4
	if already_done :
		pass


func _on_DefenceButton_pressed():
	$BM/MasterBoard/Fighting_options/defence/DefenceButton.visible = false
	stop_defence()
	$BM/MasterBoard/Fighting_options/defence/defence_button_sound.play()
	if Global.rage_Level >= 0:
		Global.rage_Level -= 1
		emit_signal("rage")
		pass
	w_s = 1
	Global.right = true
	$BM/MasterBoard/Choosing_option/Left/pointing_arrow.set_process(true)
	$BM/MasterBoard/Choosing_option/Right/pointing_arrow.set_process(true)
	$BM/MasterBoard/Choosing_option/between_left/pointing_arrow.set_process(true)
	Global.blocked = true
	yield(get_tree().create_timer(0.1),"timeout")
	Global.enemy_state = 4
	$BM/MasterBoard/Fighting_options/defence/DefenceButton.disabled = true
	yield(get_tree().create_timer(2),"timeout")
	$BM/MasterBoard/Fighting_options/defence/DefenceButton.disabled = false
	pass 

func stop_defence():
	yield(get_tree().create_timer(2),"timeout")
	$BM/MasterBoard/Fighting_options/defence/DefenceButton.visible = true
	pass
func _process(delta):
	if Global.unlocked_fighting_options:
		$BM/MasterBoard/Fighting_options/defence/DefenceButton.disabled = false
		$BM/MasterBoard/Fighting_options/fight/AttackButton.disabled = false
	if (Global.unlocked_fighting_options == false):
		$BM/MasterBoard/Fighting_options/defence/DefenceButton.disabled = true
		$BM/MasterBoard/Fighting_options/fight/AttackButton.disabled = true
		pass
	pass

func start():
	Global.blocked = false
	#get_node("Pause_button").visible = true
	get_node("exit_button").visible = true
	$BM/MasterBoard/Fighting_options/defence/DefenceButton.disabled = true
	$BM/MasterBoard/Fighting_options/fight/AttackButton.disabled = true
	equation_caller()
	$BM/MasterBoard/Choosing_option/True_and_False.position = $BM/MasterBoard/Choosing_option/true_and_false_pos.position
	_rage_bar()
	pass


func _on_Choosing_option_wrong():
	yield(get_tree().create_timer(0.5),"timeout")
	wrong_or_slow()
	already_done = true
	pass 

func come_in_screen():
	$crowd.play()
	$BM/Pressure_Timer.start()
	var z = clock.instance()
	$Clock_for_equation.add_child(z)
	tween.interpolate_property(i, "position",i.position, Vector2(415, 480),0.1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	tween.interpolate_property(h, "position",h.position, Vector2(0, 0),0.1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	start()
	pass


func _on_Pause_button_pressed():
	$Pause_button/pause_button_sound.play()
	if pause == 0 :
		get_tree().paused = true
		$Pause_button/pause_timer.start()
	if pause == 1 :
		get_tree().paused = false
		pause = 0
	pass # Replace with function body.


func _on_pause_timer_timeout():
	pause = 1
	pass # Replace with function body.

func _rage_bar():
	$Rage_bar/rage_bar.show()
	$Tween.interpolate_property(b, 'modulate', Color(1, 1, 1, 0),Color(1, 1, 1, 0.8), 0.3, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	pass


func _on_Health_bar_check():
	emit_signal("double_check")
	pass # Replace with function body.


func _on_rage_bar_rage_full():
	$"Equation/New equationTimer".stop()
	yield(get_tree().create_timer(5),"timeout")
	$Rage_bar/rage_bar.empty()
	Global.e_damage = Global.e_damage/2
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().change_scene('res://Main_Screen/Main_Menu.tscn')
	pass # Replace with function body.
