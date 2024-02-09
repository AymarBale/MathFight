extends Node2D
var numbers = preload("res://Pre_start_screen/number background/number_spawner.tscn")
var x = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	_spawn_number1()
	_spawn_number2()
	_spawn_number3()
	yield(get_tree().create_timer(0.2),"timeout")
	if x == 0 :
		$number_container/r_one/Timer_one.start()
	if x == 1 :
		$number_container/r_two/Timer_two.start()
	pass # Replace with function body.

func _spawn_number1():
	if x == 0 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/A1.position
	if x == 1 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/B1.position
	if x == 2 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/C1.position

func _spawn_number2():
	if x == 0 :
	  var n = numbers.instance()
	  $number_container/r_two.add_child(n)
	  n.position = $number_appearance/A2.position
	if x == 1 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/B2.position
	if x == 2 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/C2.position

func _spawn_number3():
	if x == 0 :
	  var n = numbers.instance()
	  $number_container/r_three.add_child(n)
	  n.position = $number_appearance/A3.position
	if x == 1 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/B3.position
	if x == 2 :
	  var n = numbers.instance()
	  $number_container/r_one.add_child(n)
	  n.position = $number_appearance/C3.position


func _on_Timer_one_timeout():
	x += 1
	_ready()
	pass # Replace with function body.


func _on_Timer_two_timeout():
	x += 1
	_ready()
	$number_container/r_three/Timer_three.start()
	pass # Replace with function body.


func _on_Timer_three_timeout():
	x = 0
	_ready()
	pass # Replace with function body.
