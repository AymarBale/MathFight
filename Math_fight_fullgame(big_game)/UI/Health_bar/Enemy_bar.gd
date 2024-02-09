extends Control


onready var tween = $Tween
onready var bar = $Life
onready var health = 0


func _ready():
	determine_H_and_A()
	$Life.max_value = Global.e_health
	$Life.value = Global.e_health
	pass


func health_diminished():
	var start = bar.value
	var end = bar.value - Global.p_damage
	if health != 0 :
		$Life.value -= Global.p_damage
		animate_value(start,end)
		$health_timer.start()
	if Global.e_health != 0:
		Global.e_health -= Global.p_damage
	if Global.e_health <= 0 :
		Global.money += Global.reward
		Global.winner = true

func animate_value(start,end):
	tween.interpolate_property(bar,"value",start,end, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	pass

func _on_health_timer_timeout():
	health -= Global.p_damage

func determine_H_and_A():
	if Global.e_skin == 1:
		Global.e_health = 8
		health = 8
		Global.e_damage = 4
	if Global.e_skin == 2:
		Global.e_health = 12
		health = 12
		Global.e_damage = 4
		pass
	if Global.e_skin == 3:
		Global.e_health = 16
		health = 16
		Global.e_damage = 5
		pass
	if Global.e_skin == 4:
		Global.e_health = 25
		health = 25
		Global.e_damage = 6
		pass
	if Global.e_skin == 5:
		Global.e_health = 36
		health = 36
		Global.e_damage = 8
		pass
	if Global.e_skin == 6:
		Global.e_health = 56
		health = 56
		Global.e_damage = 9
		pass
