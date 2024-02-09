extends Node2D

var fighter_mode = 0
var dragging = false
var swipe 
var last_pos = Vector2(0,0)
var x = 0
var time_off = false

signal swipe_positif
signal swipe_negatif

func _ready():
	pass

func _input(event):
	if fighter_mode > 0 :
		if time_off == false:
			if event is InputEventScreenTouch:
				if event.position.x > 300 && event.position.y > 150 && event.position.y < 450:
					if x == 0:
						$begin.position = event.position 
						x = 1
					if !dragging and event.pressed:
						dragging = true
				if dragging and !event.pressed:
					dragging = false
					last_pos = $final.position
					yield(get_tree().create_timer(0.1), "timeout")
					swipe_analyzor()
			if event is InputEventScreenDrag and dragging:
				$final.position = event.position
		if time_off :
			pass


func _process(delta):
	swipe = $final.position.x - $begin.position.x 
	pass

func swipe_analyzor():
	if swipe < -100:
		$Label.text = str("Swipe_Positif")
		emit_signal("swipe_positif")
		time_off = true
		yield(get_tree().create_timer(1), "timeout")
		time_off = false
		print(swipe)
	if swipe > 100 :
		$Label.text = str("Swipe_Negatif")
		emit_signal("swipe_negatif")
		time_off = true
		yield(get_tree().create_timer(1), "timeout")
		time_off = false
		print(swipe)
	x = 0
	pass

