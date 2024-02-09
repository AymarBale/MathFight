extends Node2D
signal fill_up
var x = 0
var last_pos = Vector2(113.5,161.91)
onready var v = get_node("clock/t")
onready var i = get_node("kiKno7ByT")
onready var tween = $Tween
export (float) var duration = 0.5

func _ready():
	pass


func showtime():
	empty()
	$indication_arrow_timer.start()
	pass

func empty():
	yield(get_tree().create_timer(0.8),"timeout")
	$clock_sound.play()
	tween.interpolate_property(v,"value",100,0, 1.8,duration,Tween.TRANS_LINEAR)
	tween.start()
	pass # Replace with function body.



func _on_indication_arrow_timer_timeout():
	if $kiKno7ByT.position.x >= 113.5 :
	   $kiKno7ByT.position.x -= 12.5#13.8
	if $kiKno7ByT2.position.x >= 113.5 :
	   $kiKno7ByT2.position.x -= 12.5#13.8



func fill_up():
	$clock_sound.stop()
	tween.interpolate_property(v,"value",0,100, 1,duration,Tween.TRANS_LINEAR)
	tween.start()
	pass # Replace with function body.


func _on_final_clock_fill_up():
	fill_up()
	pass # Replace with function body.
