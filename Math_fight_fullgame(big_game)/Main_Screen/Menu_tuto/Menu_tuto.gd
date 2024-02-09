extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var niv = 0
var intro = "Welcome to the menu tutorial here "+"\n "+"you will learn to navigate "+"\n "+"math fight's menu"
var gamemode = "Press the gamemode button "+"\n "+"to see all the gamemodes that"+"\n "+" are available to play"
var fighters = "Press the fighteer button to see all "+"\n "+"the available fighter of the game and"+"\n "+"to choose yours"
var ending = "Congratulation you've finish the "+"\n "+"tutorial"

onready var text = $intruction
onready var p = $Pointer/Sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	p.hide()
	text()
	pass # Replace with function body.

func text():
	if niv == 0:
		text.text = str(intro)
		$next_button.show()
	if niv == 1:
		text.text = str(fighters)
		p.position = Vector2(100,167)
		p.show()
	if niv == 2:
		text.text = str(gamemode)
		p.position = Vector2(100,450)
	if niv == 3:
		text.text = str(ending)
		p.hide()
	if niv >= 4:
		get_parent().arcade()
		queue_free()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_next_pressed():
	niv += 1
	text()
	pass # Replace with function body.
