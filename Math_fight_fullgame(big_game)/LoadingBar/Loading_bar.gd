extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CHIBI.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_CHIBI_timeout():
	if x == 0 :
		$Title/Sketsa01.rotation_degrees = 14.5
		$Title/Sketsa02.rotation_degrees = 14.5
		x = 1 
		return
	if x == 1 :
		$Title/Sketsa01.rotation_degrees = -14.5
		$Title/Sketsa02.rotation_degrees = -14.5
		x = 0 
		return
	pass # Replace with function body.
