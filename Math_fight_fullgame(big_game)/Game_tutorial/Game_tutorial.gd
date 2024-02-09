extends Node2D


var niv = 0
var intro = "Welcome to the tutorial in this part you will "+"\n "+"learn the basic of math fights fighting system "+"\n "+"when you're ready click the start button to begin"
var explanation = "First the equation will appear"
var option = "then you will need to choose the correct answer"
var fightingOption = " choose the fighting option that you want"
var attack = "if you use the attack you will deal damage "+"\n "+"but the enemy rage bar will go up" 
var defence = "if you use the defence you will not deal"+"\n "+" any damage but the enemy rage bar will go down" 
var rage_bar = "finally if the enemy's rage bar is full the enemy will"+"\n "+" deal double the amount of damage"
var wrong = "if you get the answer wrong you will "+"\n "+"automaticaly loose health and won't be able "+"\n "+"to choose between fighting options "
var ending = "You have now finish the tutorial "+"\n "+"now you can access the game "+"\n "+"the tutorial will always be accessible "+"\n "+"by clicking the tutorial icon on the main menu "
var text_pos = Vector2(441,300)
var n_call = 0
var unlock_a = false
var unlock_b = false
var wrong_b = false

onready var point = get_node("Pointer")
onready var point2 = get_node("Pointer2")
onready var dark = get_node("CanvasModulate")
onready var next = get_node("Next_button")
onready var p_l = $Pointer/Sprite/Light2D
onready var p_health = $health_bar/player_health
onready var e_health = $health_bar/enemy_health

func _ready():
	if Global.sound:
		$AudioStreamPlayer2D.play()
	$Next_button.hide()
	$Characters/enemy/AnimatedSprite2.play("idle")
	$Instruction/Label.text  = str(intro)
	$Instruction/Label/Light2D.position = text_pos
	p_l.hide()
	point.hide()
	point.rotation = -45
	point2.hide()
	point2.rotation = -45
	pass


func _on_start_button_released():
	if niv == 0:
		niv += 1
		text()
		$Instruction/start_button.hide()
	if niv == 5:
		if Global.tutorial_done == 1 :
		 SceneChanger.goto_scene("res://Main_Screen/Main_Menu.tscn",self)
		if Global.tutorial_done == 0 :
		 Global.tutorial_done = 1
		 yield(get_tree().create_timer(0.5), "timeout")
		 SceneChanger.goto_scene("res://Gamemodes/arcades/Arcade.tscn",self)
		 return
	pass # Replace with function body.

func text():
	if niv == 1:
	 $Instruction/Label.text  = str(explanation)
	 equation()
	if niv == 2:
		$Instruction/Label.text  = str(option)
		yield(get_tree().create_timer(0.5), "timeout")
		answer()
	if niv == 3:
		$Instruction/Label.text  = str(fightingOption)
		fighting_option()
	if niv == 4:
		next.hide()
		point.show()
		point.position = Vector2(340,450)
		point.pointer()
		wrong_b = true
		pass
	if niv == 5:
		point.hide()
		$Instruction/Label.text  = str(rage_bar)
		next.show()
		pass
	pass

func equation():
	if n_call == 0 :
		$Equation/e_timer.start()
		pass
	if n_call == 1 :
		$Equation/e_timer.start()
		pass
	if n_call == 2 :
		$Equation/e_timer.start()
		niv = 2
		yield(get_tree().create_timer(1.2), "timeout")
		text()
	pass


func _on_e_timer_timeout():
	if n_call == 0 :
		$Equation/one.show()
		$Equation/one.text = str("1")
		n_call += 1
		equation()
		return
	if n_call == 1 :
		$Equation/plus.show()
		$Equation/plus.text = str("+")
		n_call += 1
		equation()
		return
	if n_call == 2 :
		$Equation/two.show()
		$Equation/two.text = str("2")
		n_call += 1
		equation()
		return
	pass # Replace with function body.

func answer():
	$MainBoard/paper_panel_2200_x_181/right/Label.show()
	$MainBoard/paper_panel_2200_x_181/left/Label.show()
	yield(get_tree().create_timer(0.5), "timeout")
	point.show()
	pointer()
	pass

func pointer():
	point.position = Vector2(525,450)
	point.pointer()
	pass


func _on_right_released():
	if niv == 2:
		niv = 3
		text()
	pass # Replace with function body.

func fighting_option():
	point2.show()
	point.position = Vector2(200,345)
	point.pointer()
	point2.position = Vector2(690,345)
	point2.pointer()
	unlock_a = true
	unlock_b = true
	pass

func attack():
	$Characters/player/AnimatedSprite.play("attack")
	$Characters/enemy/AnimatedSprite2.play("hurt")
	$p/ProgressBar.value += 33
	pass

func defence():
	$Characters/player/AnimatedSprite.play("block")
	$Characters/enemy/AnimatedSprite2.play("attack")
	$p/ProgressBar.value -= 33
	pass


func _on_attack_released():
	if unlock_a :
	  point.hide()
	  attack()
	  $Instruction/Label.text  = str(attack)
	  unlock_a = false
	  e_health.value -= 1
	  check()
	pass 

func _on_defence_pressed():
	if unlock_b:
	  point2.hide()
	  defence()
	  $Instruction/Label.text  = str(defence)
	  unlock_b = false
	  check()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	$Characters/player/AnimatedSprite.play("idle")
	pass # Replace with function body.


func _on_AnimatedSprite2_animation_finished():
	$Characters/enemy/AnimatedSprite2.play("idle")
	pass # Replace with function body.

func check():
	if unlock_a == false && unlock_b == false :
		next.show()
		$Instruction/Label.text += str("\n "+"Press next to continue")
	pass


func wrong():
	$Characters/player/AnimatedSprite.play("hurt")
	$Characters/enemy/AnimatedSprite2.play("attack")
	p_health.value -= 1
	next.show()
	niv = 5
	text()
	pass


func _on_left_pressed():
	if wrong_b:
		wrong()
		wrong_b = false
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	if niv == 3:
		$Instruction/Label.text  = str(wrong)
		niv += 1
		text()
	if niv == 5:
		$Instruction/Label.text  = str(ending)
		$Instruction/start_button.show()
		next.hide()
		pass

