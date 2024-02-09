extends Node2D
signal check

func player_life_decreased():
	$Player_bar.health_diminished()
	emit_signal("check")

func enemy_life_decreased():
	$Enemy_bar.health_diminished()
	emit_signal("check")
