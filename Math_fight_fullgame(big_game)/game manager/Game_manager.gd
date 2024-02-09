extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$values/lv2.text = str(Global.level2_unlock)
	$values/lv3.text = str(Global.level3_unlock)
	$values/lv4.text = str(Global.level4_unlock)
	$values/lv5.text = str(Global.level5_unlock)
	$values/mat.text = str(Global.Mathieux)
	$values/vin.text = str(Global.Vince)
	$values/brook.text = str(Global.Brook)
	$values/fer.text = str(Global.Fernando)
	$values/dev.text = str(Global.Devo)
	$values/game_tutorial.text = str(Global.menu_tuto)
	$values/already.text = str(Global.tutorial_done)
	pass


func _on_Resetter_pressed():
	Global.level2_unlock = 0
	Global.level3_unlock = 0
	Global.level4_unlock = 0
	Global.level5_unlock = 0
	Global.Mathieux = 0
	Global.Vince = 0
	Global.Brook = 0
	Global.Fernando = 0
	Global.Devo = 0
	Global.money = 0
	Global.tutorial_done = 0
	Global.menu_tuto = 0
	Global.save_xp()
	Global.save_character()
	Global.save_score()
	Global.save_unlock_lv2()
	Global.save_unlock_lv3()
	Global.save_unlock_lv4()
	Global.save_unlock_lv5()
	Global.save_unlock_lv6()
	pass # Replace with function body.
