extends Control


onready var tween = $Tween
onready var bar = $Life
onready var health = 0

#EACH TIME THAT I PUNCH HIM HE GETS HES LIFE BACK

func _ready():
	determine_H_and_A()
	$Life.max_value = Global.p_health 
	$Life.value = Global.p_health 

func health_diminished():
	var start = bar.value
	var end = bar.value - Global.e_damage
	if health != 0 :
		$Life.value -= Global.e_damage
		animate_value(start,end)
		$health_timer.start()
	if Global.p_health != 0:
		Global.p_health -= Global.e_damage
	if Global.p_health <= 0 :
		Global.looser = true

func animate_value(start,end):
	tween.interpolate_property(bar,"value",start,end, 1.9,Tween.TRANS_ELASTIC)
	tween.start()
	yield($Tween,"tween_completed")
	$health_lost.play()
	pass

func _on_health_timer_timeout():
	health -= Global.e_damage

func determine_H_and_A():
	if Global.p_skin == 1:
		Global.p_health = 8
		health = 8
		Global.p_damage = 4
	if Global.p_skin == 2:
		Global.p_health = 12
		health = 12
		Global.p_damage = 4
		pass
	if Global.p_skin == 3:
		Global.p_health = 16
		health = 16
		Global.p_damage = 5
		pass
	if Global.p_skin == 4:
		Global.p_health = 25
		health = 25
		Global.p_damage = 6
		pass
	if Global.p_skin == 5:
		Global.p_health = 36
		health = 36
		Global.p_damage = 8
		pass
	if Global.p_skin == 6:
		Global.p_health = 56
		health = 56
		Global.p_damage = 9
		pass
