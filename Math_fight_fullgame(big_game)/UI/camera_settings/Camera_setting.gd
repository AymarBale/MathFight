extends Node2D


func _process(delta):
	if Global.enemy_state == 6 :
		$Camera2D.position.x = 750
		$Return_Cam_Timer.start()
	if Global.player_state == 6 :
		$Camera2D.position.x = 100
		$Return_Cam_Timer.start()
	if Global.player_state == 7 :
		$Camera2D.position.x = 100
		$Return_Cam_Timer.start()



func _on_Return_Cam_Timer_timeout():
	#if Global.enemy_state == 4 :
	$Camera2D.position.x = $Cam_pos.position.x
	pass # Replace with function body.
