extends Node2D

var warning = load('res://Main_Screen/window/window.tscn')


func _ready():
	pass # Replace with function body.


func _process(delta):
	if Global.level2_unlock == 1:
		$City2/lock.hide()#add for the other characters
		$City1/star_g1.show()
	if Global.level3_unlock == 1:
		$City3/lock2.hide() 
		$City2/star_g2.show()
	if Global.level4_unlock == 1:
		$City4/lock2.hide() 
		$City3/star_g3.show()
	if Global.level5_unlock == 1:
		$City5/lock3.hide()
		$City4/star_g4.show()
	if Global.level6_unlock == 1:
		$City6/lock4.hide() 
		$City5/star_g5.show()
#	pass


func _on_city_1_button_pressed():
	if Global.p_skin != 0:
		get_parent().sound_off()
		Global.background = 1
		SceneChanger.goto_scene("res://Level/Level.tscn",self)
		Global.e_skin = 2
		Global.reward = 100
	if Global.p_skin == 0:
		var j = warning.instance()
		add_child(j)
		j.w = 'character not selected'
		safety_on()
		j.connect('safe_to_pursue',self,'safety_off')
		pass
	pass # Replace with function body.

func safety_on():
	$City1/city_1_button.visible = false
	$City2/city_2_button.visible = false
	$City3/city_3_button.visible = false
	$City4/city_4_button.visible = false
	$City5/city_5_button.visible = false
	pass

func safety_off():
	yield(get_tree().create_timer(0.5),"timeout")
	$City1/city_1_button.visible = true
	$City2/city_2_button.visible = true
	$City3/city_3_button.visible = true
	$City4/city_4_button.visible = true
	$City5/city_5_button.visible = true
	pass

func _on_city_2_button_pressed():
	if Global.p_skin != 0:
		if Global.level2_unlock == 1 :
			get_parent().sound_off()
			Global.background = 2
			SceneChanger.goto_scene("res://Level/Level.tscn",self)
			Global.e_skin = 3
			$City2/lock.hide()
			Global.reward = 200
	if Global.p_skin == 0:
			var j = warning.instance()
			add_child(j)
			j.w = 'character not selected'
			safety_on()
			j.connect('safe_to_pursue',self,'safety_off')
	pass # Replace with function body.


func _on_city_3_button_pressed():
	if Global.p_skin != 0:
		if Global.level3_unlock == 1:
			get_parent().sound_off()
			Global.background = 3
			SceneChanger.goto_scene("res://Level/Level.tscn",self)
			Global.e_skin = 4
			$City3/lock2.hide()
			Global.reward = 300
	if Global.p_skin == 0:
			var j = warning.instance()
			add_child(j)
			j.w = 'character not selected'
			safety_on()
			j.connect('safe_to_pursue',self,'safety_off')
	pass # Replace with function body.


func _on_city_4_button_pressed():
	if Global.p_skin != 0:
		if Global.level4_unlock == 1 :
			get_parent().sound_off()
			Global.background = 4
			SceneChanger.goto_scene("res://Level/Level.tscn",self)
			Global.e_skin = 5
			$City4/lock2.hide()
			Global.reward = 400
	if Global.p_skin == 0:
			var j = warning.instance()
			add_child(j)
			j.w = 'character not selected'
			safety_on()
			j.connect('safe_to_pursue',self,'safety_off')
	pass # Replace with function body.


func _on_city_5_button_pressed():
	if Global.p_skin != 0:
		if Global.level5_unlock == 1:
			get_parent().sound_off()
			Global.background = 5
			SceneChanger.goto_scene("res://Level/Level.tscn",self)
			Global.e_skin = 6
			$City5/lock3.hide()
			Global.reward = 500
	if Global.p_skin == 0:
		   var j = warning.instance()
		   add_child(j)
		   j.w = 'character not selected'
		   safety_on()
		   j.connect('safe_to_pursue',self,'safety_off')
	pass 


func _on_city_6_button_pressed():
	if Global.level6_unlock == 0 :
		Global.background = 6
		get_tree().change_scene("res://Level/Level.tscn")
		Global.e_skin = 7
		$City6/lock4.hide()
	pass # Replace with function body.
