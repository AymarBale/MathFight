extends Node2D
onready var b = load("res://UI/Cartoon_bubble_speech/Cartoon_speech_bubble.tscn")
var player_mov = false
var enemy_mov = false
var e_walk_up = true
var p_walk_up = true




func _ready():
	player_mov = false
	enemy_mov = false
	e_walk_up = true
	p_walk_up = true
	$Enemy.set_process(false)
	$Enemy.e_skin.play("idle")
	$Player.set_process(false)
	$Player.p_skin.play("idle")
	$Walk_up_Timer.start()
	pass

func check_player_pos():
	if Global.right:
		if (Global.blocked == false):
			if $Player.position <= $Player_pos.position :
				Global.player_state = 1
				player_mov = false
				pass
		if Global.blocked : 
			if $Player.position >= $Player_pos.position :
				Global.player_state = 1
				player_mov = false
				pass
	if (Global.right == false):
		if $Player.position >= $Player_pos.position :
			Global.player_state = 1
			player_mov = false

func check_enemy_pos():
	if Global.right:
		if (Global.blocked == false):
			if $Enemy.position <= $Enemy_pos.position :
				Global.enemy_state = 1
				enemy_mov = false
		if Global.blocked : 
			if $Enemy.position >= $Enemy_pos.position :
				Global.enemy_state = 1
				enemy_mov = false
				pass
	if (Global.right == false):
		if $Enemy.position >= $Enemy_pos.position :
		 Global.enemy_state = 1
		 enemy_mov = false
		 pass

func _process(delta):
	walk_up()
	if player_mov:
		check_player_pos()
	if enemy_mov :
		check_enemy_pos()

func _on_Player_check_pos():
	player_mov = true
	pass # Replace with function body.

func _on_Enemy_check_pos_en():
	enemy_mov = true
	pass

func walk_up():
	if p_walk_up :
	 if $Player.position.x >= $Player_pos.position.x:
	   Global.player_walk_up = 0
	   Global.player_state = 1
	   $Player.p_skin.set_speed_scale(1)
	   p_walk_up = false
	if e_walk_up :
	 if $Enemy.position.x <= $Enemy_pos.position.x:
	   Global.enemy_walk_up = 0
	   Global.enemy_state = 1
	   $Enemy.e_skin.set_speed_scale(1)
	   e_walk_up = false
	   pass
	pass


func _on_Walk_up_Timer_timeout():
	$Enemy.set_process(true)
	$Enemy.e_skin.play("walk_forward")
	$Player.set_process(true)
	$Player.p_skin.play("walk_forward")
	pass # Replace with function body.


func _on_Player_speech_bubble():
	var bubble = b.instance()
	$cartoon_bubble.add_child(bubble)
	bubble.position = $Bubble_pos.position
	pass # Replace with function body.
