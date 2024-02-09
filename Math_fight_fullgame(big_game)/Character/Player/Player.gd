extends Node2D

signal check_pos
signal speech_bubble


var flash = 0
var p_idle
var p_attack
var p_defense
var p_walk_foward
var p_walk_back
var m = load("res://Character/Mood/Mad.tscn")
var h = load("res://Character/Mood/Hurt.tscn")
var s = load("res://Character/Shield/Shield.tscn")
var p_skin 

func _process(delta):
	_player_state()
	if Global.player_walk_up == 1 : 
		position.x += 5
	pass


func skin():
	if Global.p_skin == 1 :
		$skins/blake.show()
		p_skin = $skins/blake
		$skins/devo.hide()
		$skins/brook.hide()
		$skins/fernando.hide()
		$skins/mathieux.hide()
		$skins/vince.hide()
	if Global.p_skin == 2 :
		p_skin = $skins/mathieux
		$skins/mathieux.show()
		$skins/blake.hide()
		$skins/brook.hide()
		$skins/devo.hide()
		$skins/fernando.hide()
		$skins/vince.hide()
		pass
	if Global.p_skin == 3 :
		$skins/brook.show()
		p_skin = $skins/brook
		$skins/blake.hide()
		$skins/mathieux.hide()
		$skins/devo.hide()
		$skins/fernando.hide()
		$skins/vince.hide()
		pass
	if Global.p_skin == 4 :
		$skins/vince.show()
		p_skin = $skins/vince
		$skins/mathieux.hide()
		$skins/blake.hide()
		$skins/devo.hide()
		$skins/fernando.hide()
		$skins/brook.hide()
		pass
	if Global.p_skin == 5 :
		$skins/fernando.show()
		p_skin = $skins/fernando
		$skins/blake.hide()
		$skins/brook.hide()
		$skins/devo.hide()
		$skins/mathieux.hide()
		$skins/vince.hide()
		pass
	if Global.p_skin == 6 :
		$skins/devo.show()
		p_skin = $skins/devo
		$skins/blake.hide()
		$skins/brook.hide()
		$skins/fernando.hide()
		$skins/mathieux.hide()
		$skins/vince.hide()
		pass
	pass


func walk_up():
	p_skin.play("walk_forward")
	p_skin.set_speed_scale(0.5)
	Global.player_walk_up = 1


func _ready():
	skin()
	if (Global.looser == false) :
	   Global.blocked = false
	   Global.player_state = 0
	   walk_up()


func _player_state():
	if Global.player_state == 1 :
		p_idle()
	if Global.player_state == 2 :
		p_attack()
	if Global.player_state == 4 :
		p_walk_forward()
	if Global.player_state == 5 :
		p_walk_backward()
	if Global.player_state == 6 :
		p_hit()
	if Global.player_state == 7 :
		p_defence()
		pass

func p_defence():
	#blake hide()
	p_skin.play("block")
	var shield = s.instance()
	add_child(shield)
	shield.position = $Shield.position
	yield(p_skin,"animation_finished")
	position.x -= 10
	yield(get_tree().create_timer(0.2),"timeout")
	Global.player_state = 4
	pass

func p_idle():
	p_skin.play("idle")
	pass

func p_attack():
	p_skin.play("attack")
	yield(p_skin,"animation_finished")
	Global.player_state = 5
	emit_signal("check_pos")
	mad()
	pass

func p_walk_forward():
	if Global.right:
		if (Global.blocked == false):
			speed_effect()
			p_skin.play("walk_forward")
			position.x += 40
		if Global.blocked :
			p_skin.play("walk_forward")
			position.x += 10
			emit_signal("check_pos")
	if (Global.right == false):
		p_skin.play("walk_forward")
		position.x += 10
		emit_signal("check_pos")
		pass
	pass

func p_walk_backward():
	p_skin.play("walk_back")
	position.x -= 10
	pass

func p_hit():
		flash = 0
		flash()
		p_skin.play("hit")
		yield(p_skin,"animation_finished")
		hurt()
		position.x -= 12
		Global.player_state = 4
		pass


func _on_Area2D_area_entered(area):
	if Global.right :
		if (Global.blocked == false):
			Global.player_state = 2
			emit_signal("speech_bubble")
		if Global.blocked :
			Global.player_state = 7
			emit_signal("speech_bubble")
			pass
	if (Global.right == false):
		Global.player_state = 6
		emit_signal("speech_bubble")


func flash():
	$"Flash/Flash-Timer".start()

func _on_FlashTimer_timeout():
	if flash <= 3 :
	   p_skin.hide()
	   flash += 1 
	   $"Flash/Return-Timer".start()

func _on_ReturnTimer_timeout():
	if flash <= 3:
		p_skin.show()
		flash += 1
		$"Flash/Flash-Timer".start()

func speed_effect():
	$Speed_effects/Sprite.show()
	$Speed_effects/Speed_Effect_Timer.start()
	$Sound/teleport.play()

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
	$AnimatedSprite.play("winner")
	pass


func _on_AnimatedSprite_animation_finished():
	if(p_skin.animation == "walk_forward"):
		$Sound/footsteps.play()
	if(p_skin.animation == "walk_back"):
		$Sound/footsteps.play()
	if(p_skin.animation == "attack"):
		$Sound/punch.play()
	if(p_skin.animation == "hit"):
		$Sound/hurt.play()
	pass 
