extends Node2D

onready var tween = $Tween
onready var frame = $frame
signal fighter



func _ready():
	frame.position = $Option_pos/Game_mode_pos.position
	pass # Replace with function body.



func to_fighters():
	tween.interpolate_property(frame, "position",$frame.position, $Option_pos/Fighter_pos.position,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	pass

func to_shop():
	tween.interpolate_property(frame, "position",$frame.position, $Option_pos/Shop_pos.position,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	pass

func to_game_mode():
	tween.interpolate_property(frame, "position",$frame.position, $Option_pos/Game_mode_pos.position,1,Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	pass

func _on_Fighter_button_pressed():
	$Fighter/fighter_button_sound.play()
	to_fighters()
	emit_signal("fighter")
	pass # Replace with function body.


func _on_Shop_button_pressed():
	to_shop()
	pass # Replace with function body.


func _on_Game_mode_pressed():
	$Game_mode/gamemode_button_sound.play()
	to_game_mode()
	pass # Replace with function body.
