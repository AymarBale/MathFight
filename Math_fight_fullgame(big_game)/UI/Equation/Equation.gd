extends Node2D
signal over
signal show_answer
signal start_clock
var v
var x 
var y 
var w 
var e 
var o 
var inter_x 
var inter_y 
var inter_w 
var inter_e 
var z 

func equation():
	x = RandomNumberGenerator.new()
	y = RandomNumberGenerator.new()
	w = RandomNumberGenerator.new()
	e = RandomNumberGenerator.new()
	o = RandomNumberGenerator.new()
	x.randomize()
	y.randomize()
	w.randomize()
	e.randomize()
	inter_x = x.randi_range(0,50)
	inter_y = y.randi_range(51,100)
	inter_w = w.randi_range(15,33)
	inter_e = e.randi_range(1,3)
	z = inter_x + inter_y 
	v = inter_w + z
	$first/First.text = str(inter_x)
	$second/second.text = str(inter_y)
	$plus/plus.text = str("+")
	Global.answer = z


func _ready():
	equation()
	equation_start()


func equation_start():
	$first/First_Timer.start()


func _on_First_Timer_timeout():
	$first.pop()
	$plus/Plus_Timer.start()
	$gun_shot.play()


func _on_Plus_Timer_timeout():
	$plus.pop()
	$second/Second_Timer.start()
	$gun_shot.play()


func _on_Second_Timer_timeout():
	$second.pop()
	$Duration_timer.start()
	$gun_shot.play()
	emit_signal("show_answer")
	pass 

func over():
	$first.fade_in()
	$plus.fade_in()
	$second.fade_in()
	emit_signal("over")

func cut_in():
	over()
	$Duration_timer.stop()
	pass

func _on_Duration_timer_timeout():
	over()
	pass # Replace with function body.

func clock():
	#$clock.play("clock")
	#$clock.pop()
	pass
