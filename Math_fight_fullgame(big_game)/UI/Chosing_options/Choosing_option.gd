extends Node2D
signal wrong

func _on_Left_pressed():
	check_left_button_answer()
	$Left/pointing_arrow.set_process(false)
	$Right/pointing_arrow.set_process(false)
	$between_left/pointing_arrow.set_process(false)
	$Left/left_button_sound.play()
	pass # Replace with function body.

func check_left_button_answer():
	if $Left/Left_Label.text == str(Global.answer):
		Global.unlocked_fighting_options = true
		$True_and_False.correct()
	if $Left/Left_Label.text != str(Global.answer):
		$True_and_False.wrong()
		emit_signal("wrong")
		pass
	pass

func check_right_button_answer():
	if $Right/Right_Label.text == str(Global.answer):
		Global.unlocked_fighting_options = true
		$True_and_False.correct()
	if $Right/Right_Label.text != str(Global.answer):
		$True_and_False.wrong()
		emit_signal("wrong")
	pass


func _on_Right_pressed():
	check_right_button_answer()
	$Left/pointing_arrow.set_process(false)
	$Right/pointing_arrow.set_process(false)
	$between_left/pointing_arrow.set_process(false)
	$Right/Right_button_sound.play()
	pass # Replace with function body.


func _on_between_left_pressed():
	check_between_left_button_answer()
	$Left/pointing_arrow.set_process(false)
	$Right/pointing_arrow.set_process(false)
	$between_left/pointing_arrow.set_process(false)
	$between_left/between_left_sound.play()
	pass # Replace with function body.

func check_between_left_button_answer():
	if $between_left/between_left_Label.text == str(Global.answer):
		Global.unlocked_fighting_options = true
		$True_and_False.correct()
	if $between_left/between_left_Label.text != str(Global.answer):
		$True_and_False.wrong()
		emit_signal("wrong")
	pass
