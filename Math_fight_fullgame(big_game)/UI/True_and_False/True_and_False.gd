extends Node2D

func correct():
	$True.show()
	$False.hide()
	$Timer.start()
	$right.play()
	pass

func wrong():
	$False.show()
	$True.hide()
	$Timer.start()
	$wrong.play()

func _on_Timer_timeout():
	$True.hide()
	$False.hide()
	pass # Replace with function body.
