extends Node2D

onready var i #= $Sprite
onready var tween = $Tween
var p = RandomNumberGenerator.new()
var z 
export (Vector2) var final_scale = Vector2(0.825,0.825)
export (Vector2) var previous_scale =  Vector2(0.1,0.1)#PRESSUREVector2(0.4,0.825)#STARTVector2(0.1,0.1)

export (float) var duration = 0.3

func _ready():
	effect()
	choose_a_sprite()
	pass

func lo():
	$Tween.interpolate_property(i, 'modulate', Color(1, 1, 1, 0.5),Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	queue_free()
	pass 

func choose_a_sprite():
	p.randomize()
	var c = p.randi_range(1,7) 
	z = c
	print(z)
	pass


func _process(delta):
	if z == 1 :
		i = $Bubble_moderator/Sprite
		$Bubble_moderator/Sprite.show()
		#$K_a.play()
	if z == 2 :
		i = $Bubble_moderator/Sprite2
		$Bubble_moderator/Sprite2.show()
		#$K_a.play()
	if z == 3 :
		i = $Bubble_moderator/Sprite3
		$Bubble_moderator/Sprite3.show()
		#$K_b.play()
	if z == 4 :
		i = $Bubble_moderator/Sprite4
		$Bubble_moderator/Sprite4.show()
		#$K_b.play()
	if z == 5 :
		i = $Bubble_moderator/Sprite5
		$Bubble_moderator/Sprite5.show()
		#$K_c.play()
	if z == 6 :
		i = $Bubble_moderator/Sprite6
		$Bubble_moderator/Sprite6.show()
		#$K_c.play()
	if z == 7 :
		i = $Bubble_moderator/Sprite7
		$Bubble_moderator/Sprite7.show()
		#$K_a.play()
	pass

func effect():
	$K_a.play()
	tween.interpolate_property(self,"scale", final_scale, previous_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	tween.interpolate_property(self,"scale", previous_scale, final_scale,duration, Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
	yield($Tween,"tween_completed")
	$Timer.start()
	pass

func _on_Timer_timeout():
	lo()
	pass # Replace with function body.
