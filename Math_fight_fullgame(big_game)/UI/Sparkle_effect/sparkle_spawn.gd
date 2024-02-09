extends Node2D

var x = load("res://UI/Sparkle_effect/sparkle_effect.tscn")

func _spawn():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var spark = x.instance()
	var pos_x = rand.randf_range(0,850)
	var pos_y = rand.randf_range(0,540)
	spark.position.x = pos_x
	spark.position.y = pos_y
	add_child(spark)

func _ready():
	$spawn_timer.start()

func _on_spawn_timer_timeout():
	_spawn()
	pass # Replace with function body.
