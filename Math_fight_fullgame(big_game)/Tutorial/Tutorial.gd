extends Node2D
onready var ltween = $Go_left_Tween
onready var rtween = $Go_right_Tween


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_clock_button_pressed():
	$Go_Right/selection/Text/answer_text.hide()
	$Go_Right/selection/Text/attack_text.hide()
	$Go_Right/selection/Text/clock_text.show()
	$Go_Right/selection/Text/defence_text.hide()
	$Go_Right/selection/Text/equation_text.hide()
	$Go_Right/selection/Text/rage_text.hide()
	$Go_Right/selection/Text/health.hide()
	pass # Replace with function body.

func _on_rage_bar_button_pressed():
	$Go_Right/selection/Text/answer_text.hide()
	$Go_Right/selection/Text/attack_text.hide()
	$Go_Right/selection/Text/clock_text.hide()
	$Go_Right/selection/Text/defence_text.hide()
	$Go_Right/selection/Text/equation_text.hide()
	$Go_Right/selection/Text/rage_text.show()
	$Go_Right/selection/Text/health.hide()
	pass # Replace with function body.


func _on_equation_button_pressed():
	$Go_Right/selection/Text/answer_text.hide()
	$Go_Right/selection/Text/attack_text.hide()
	$Go_Right/selection/Text/clock_text.hide()
	$Go_Right/selection/Text/defence_text.hide()
	$Go_Right/selection/Text/equation_text.show()
	$Go_Right/selection/Text/rage_text.hide()
	$Go_Right/selection/Text/health.hide()
	pass # Replace with function body.


func _on_answer_button_pressed():
	$Go_Right/selection/Text/answer_text.show()
	$Go_Right/selection/Text/attack_text.hide()
	$Go_Right/selection/Text/clock_text.hide()
	$Go_Right/selection/Text/defence_text.hide()
	$Go_Right/selection/Text/equation_text.hide()
	$Go_Right/selection/Text/rage_text.hide()
	$Go_Right/selection/Text/health.hide()
	pass # Replace with function body.


func _on_attack_button_pressed():
	$Go_Right/selection/Text/answer_text.hide()
	$Go_Right/selection/Text/attack_text.show()
	$Go_Right/selection/Text/clock_text.hide()
	$Go_Right/selection/Text/defence_text.hide()
	$Go_Right/selection/Text/equation_text.hide()
	$Go_Right/selection/Text/rage_text.hide()
	$Go_Right/selection/Text/health.hide()
	pass # Replace with function body.


func _on_defence_button_pressed():
	$Go_Right/selection/Text/answer_text.hide()
	$Go_Right/selection/Text/attack_text.hide()
	$Go_Right/selection/Text/clock_text.hide()
	$Go_Right/selection/Text/defence_text.show()
	$Go_Right/selection/Text/equation_text.hide()
	$Go_Right/selection/Text/rage_text.hide()
	$Go_Right/selection/Text/health.hide()
	pass # Replace with function body.


func _on_health_pressed():
	$Go_Right/selection/Text/answer_text.hide()
	$Go_Right/selection/Text/attack_text.hide()
	$Go_Right/selection/Text/clock_text.hide()
	$Go_Right/selection/Text/defence_text.hide()
	$Go_Right/selection/Text/equation_text.hide()
	$Go_Right/selection/Text/rage_text.hide()
	$Go_Right/selection/Text/health.show()
	pass # Replace with function body.



func _on_go_back_released():
	get_tree().change_scene('res://Main_Screen/Main_Menu.tscn')
	Global.tutorial_done += 1
	pass # Replace with function body.


func _on_go_right_pressed():
	right()
	$go_right.visible = false
	yield(get_tree().create_timer(1),"timeout")
	$go_right.visible = true
	pass # Replace with function body.


func _on_go_left_pressed():
	left()
	$go_left.visible = false
	yield(get_tree().create_timer(1),"timeout")
	$go_left.visible = true
	pass # Replace with function body.

func right():
	$Go_Right.position.x -= 864
	$go_right.position.x -= 864
	$go_left.position.x -= 864
	$Go_Left.position.x -= 864
	pass

func left():
	$Go_Left.position.x += 864
	$Go_Right.position.x += 864
	$go_right.position.x += 864
	$go_left.position.x += 864
	pass


func _on_TouchScreenButton_pressed():
	SceneChanger.goto_scene("res://Game_tutorial/Game_tutorial.tscn",self)
	pass # Replace with function body.
