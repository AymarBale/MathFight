extends Node2D
var x = 0 
func _process(delta):
	if x == 0 :
	   $Arrows/Left_arrow.position.x += 1
	   $Arrows/Right_arrow.position.x -= 1
	   $Arrows/up_arrow.position.y += 1
	   $Arrows/Down_arrow.position.y -= 1
	if x == 1 :
		$Arrows/Left_arrow.position.x -= 1
		$Arrows/Right_arrow.position.x += 1
		$Arrows/up_arrow.position.y -= 1
		$Arrows/Down_arrow.position.y += 1
	pass


func _on_come_back_wall_area_entered(area):
	x = 0

func _on_bloc_area_entered(area):
	x = 1
