extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	pass



func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.hide()
	queue_free()
	pass # Replace with function body.

func block():
	$AnimatedSprite.play("shield_up")

func _on_Timer_timeout():
	block()
	pass # Replace with function body.
