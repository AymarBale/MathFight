extends Node2D
var flash = 0
signal check_pos_en
var p_idle
var p_attack
var p_defense
var p_walk_foward
var p_walk_back
var p_hit
var m = load("res://Character/Mood/Mad.tscn")
var h = load("res://Character/Mood/Hurt.tscn")
var e_skin 

func _process(delta):
	if Global.enemy_walk_up == 1 : 
		position.x -= 5
	_player_state()
	pass


func walk_up():
	e_skin.play("walk_forward")
	e_skin.set_speed_scale(0.5)
	Global.enemy_walk_up = 1

func _ready():
	enemy_skin()
	if (Global.looser == false) :
	   Global.enemy_state = 0
	   walk_up()

func enemy_skin():
	if Global.e_skin == 1 :
		$skins/blake.show()
		e_skin = $skins/blake
		$skins/devo.hide()
		$skins/brook.hide()
		$skins/fernando.hide()
		$skins/mathieux.hide()
		$skins/vince.hide()
	if Global.e_skin == 2 :
		e_skin = $skins/mathieux
		$skins/mathieux.show()
		$skins/blake.hide()
		$skins/brook.hide()
		$skins/devo.hide()
		$skins/fernando.hide()
		$skins/vince.hide()
		pass
	if Global.e_skin == 3 :
		$skins/brook.show()
		e_skin = $skins/brook
		$skins/blake.hide()
		$skins/mathieux.hide()
		$skins/devo.hide()
		$skins/fernando.hide()
		$skins/vince.hide()
		pass
	if Global.e_skin == 4 :
		$skins/vince.show()
		e_skin = $skins/vince
		$skins/mathieux.hide()
		$skins/blake.hide()
		$skins/devo.hide()
		$skins/fernando.hide()
		$skins/brook.hide()
		pass
	if Global.e_skin == 5 :
		$skins/fernando.show()
		e_skin = $skins/fernando
		$skins/blake.hide()
		$skins/brook.hide()
		$skins/devo.hide()
		$skins/mathieux.hide()
		$skins/vince.hide()
		pass
	if Global.e_skin == 6 :
		$skins/devo.show()
		e_skin = $skins/devo
		$skins/blake.hide()
		$skins/brook.hide()
		$skins/fernando.hide()
		$skins/mathieux.hide()
		$skins/vince.hide()
	if Global.e_skin == 8 :
		e_skin = Global.t_skin 
	pass

func _player_state():
	if Global.enemy_state == 1 :
		p_idle()
	if Global.enemy_state == 2 :
		p_attack()
	if Global.enemy_state == 4 :
		p_walk_forward()
	if Global.enemy_state == 5 :
		p_walk_backward()
	if Global.enemy_state == 6 :
		p_hit()
		pass

func p_idle():
	e_skin.play("idle")
	pass

func p_attack():
	e_skin.play("attack")
	yield(e_skin,"animation_finished")
	Global.enemy_state = 5
	mad()
	pass

func p_walk_forward():
	if Global.right:
		if (Global.blocked == false):
			e_skin.play("walk_forward")
			position.x -= 10
			emit_signal("check_pos_en")
		if Global.blocked :
			speed_effect()
			e_skin.play("walk_forward")
			position.x -= 40
			pass
	if (Global.right == false):
		speed_effect()
		e_skin.play("walk_forward")
		position.x -= 40
		emit_signal("check_pos_en")
	pass

func p_walk_backward():
	e_skin.play("walk_back")
	position.x += 10
	yield(get_tree().create_timer(0.1),"timeout")
	emit_signal("check_pos_en")
	pass

func p_hit():
	flash = 0
	flash()
	e_skin.play("hit")
	yield(e_skin,"animation_finished")
	hurt()
	position.x += 12
	Global.enemy_state = 4
	pass

func _on_Area2D_area_entered(area):
	if Global.right:
		if (Global.blocked == false):
			Global.enemy_state = 6
		if Global.blocked :
			Global.enemy_state = 2
	if (Global.right == false):
		Global.enemy_state = 2

func flash():
	$"Flash/Flash-Timer".start()

func _on_FlashTimer_timeout():
	print(flash)
	if flash <= 3 :
	   e_skin.hide()
	   flash += 1 
	   $"Flash/Return-Timer".start()

func _on_ReturnTimer_timeout():
	if flash <= 3:
		e_skin.show()
		flash += 1
		$"Flash/Flash-Timer".start()


func speed_effect():
	$Speed_effects/Sprite.show()
	$Speed_effects/Speed_Effect_Timer.start()

func _on_Speed_Effect_Timer_timeout():
	$Speed_effects/Sprite.hide()
	pass # Replace with function body.

func mad():
	var mood = m.instance()
	add_child(mood)
	mood.position = $mood_pos.position

func hurt():
	var mood = h.instance()
	add_child(mood)
	mood.position = $mood_pos.position


func announcement():
	e_skin.play("winner")
	pass


func _on_AnimatedSprite_animation_finished():
	if(e_skin.animation == "walk_forward"):
		$Sound/footsteps.play()
	if(e_skin.animation == "walk_back"):
		$Sound/footsteps.play()
	if(e_skin.animation == "attack"):
		$Sound/punch.play()
	if(e_skin.animation == "hit"):
		$Sound/hurt.play()
	pass # Replace with function body.
