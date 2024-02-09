extends Node2D

var t_setup = RandomNumberGenerator.new()
var outcomes
func _ready():
	yield(get_tree().create_timer(0.5),"timeout")
	$Transition.play()
	yield($Transition,"animation_finished")
	t_order()
	participants()
	
func t_order():
	# randomize seed
	t_setup.randomize()
	# generate a random integer between 1 and 10
	outcomes = t_setup.randi_range(1,6)

func participants():
	if outcomes == 1 :
		$tournament_graph/start_pos/vince.position = $tournament_graph/start_pos/f_seed.position
		$tournament_graph/start_pos/mathieux.position = $tournament_graph/start_pos/f_seed2.position
		$tournament_graph/start_pos/fernando.position = $tournament_graph/start_pos/f_seed3.position
		$tournament_graph/start_pos/devo.position = $tournament_graph/start_pos/f_seed4.position
		$tournament_graph/start_pos/brook.position = $tournament_graph/start_pos/f_seed5.position
		$tournament_graph/start_pos/blake.position = $tournament_graph/start_pos/f_seed6.position
	if outcomes == 2 : 
		$tournament_graph/start_pos/vince.position = $tournament_graph/start_pos/f_seed6.position
		$tournament_graph/start_pos/mathieux.position = $tournament_graph/start_pos/f_seed5.position
		$tournament_graph/start_pos/fernando.position = $tournament_graph/start_pos/f_seed4.position
		$tournament_graph/start_pos/devo.position = $tournament_graph/start_pos/f_seed3.position
		$tournament_graph/start_pos/brook.position = $tournament_graph/start_pos/f_seed2.position
		$tournament_graph/start_pos/blake.position = $tournament_graph/start_pos/f_seed.position
	if outcomes == 3 : 
		$tournament_graph/start_pos/vince.position = $tournament_graph/start_pos/f_seed5.position
		$tournament_graph/start_pos/mathieux.position = $tournament_graph/start_pos/f_seed3.position
		$tournament_graph/start_pos/fernando.position = $tournament_graph/start_pos/f_seed.position
		$tournament_graph/start_pos/devo.position = $tournament_graph/start_pos/f_seed6.position
		$tournament_graph/start_pos/brook.position = $tournament_graph/start_pos/f_seed4.position
		$tournament_graph/start_pos/blake.position = $tournament_graph/start_pos/f_seed2.position
	if outcomes == 4 : 
		$tournament_graph/start_pos/vince.position = $tournament_graph/start_pos/f_seed4.position
		$tournament_graph/start_pos/mathieux.position = $tournament_graph/start_pos/f_seed.position
		$tournament_graph/start_pos/fernando.position = $tournament_graph/start_pos/f_seed5.position
		$tournament_graph/start_pos/devo.position =  $tournament_graph/start_pos/f_seed6.position
		$tournament_graph/start_pos/brook.position = $tournament_graph/start_pos/f_seed3.position
		$tournament_graph/start_pos/blake.position = $tournament_graph/start_pos/f_seed2.position
	if outcomes == 5 : 
		$tournament_graph/start_pos/vince.position = $tournament_graph/start_pos/f_seed3.position
		$tournament_graph/start_pos/mathieux.position = $tournament_graph/start_pos/f_seed4.position
		$tournament_graph/start_pos/fernando.position = $tournament_graph/start_pos/f_seed2.position
		$tournament_graph/start_pos/devo.position = $tournament_graph/start_pos/f_seed6.position
		$tournament_graph/start_pos/brook.position = $tournament_graph/start_pos/f_seed5.position
		$tournament_graph/start_pos/blake.position = $tournament_graph/start_pos/f_seed.position
	if outcomes == 6 : 
		$tournament_graph/start_pos/vince.position = $tournament_graph/start_pos/f_seed2.position
		$tournament_graph/start_pos/mathieux.position = $tournament_graph/start_pos/f_seed6.position
		$tournament_graph/start_pos/fernando.position = $tournament_graph/start_pos/f_seed4.position
		$tournament_graph/start_pos/devo.position = $tournament_graph/start_pos/f_seed.position
		$tournament_graph/start_pos/brook.position = $tournament_graph/start_pos/f_seed3.position
		$tournament_graph/start_pos/blake.position = $tournament_graph/start_pos/f_seed5.position
		pass
	pass



func _on_Go_back_button_pressed():
	get_tree().change_scene("res://Pre_start_screen/Pre_start_screen.tscn")
	pass # Replace with function body.
