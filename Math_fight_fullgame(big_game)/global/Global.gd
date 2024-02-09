extends Node

var player_state
var enemy_state
var answer
var unlocked_fighting_options = false
var right 
var to_slow = true
var player_walk_up = 0
var enemy_walk_up = 0
var rage_Level = 0
var blocked
var looser = false
var winner = false
var p_health
var e_health
var rage_full = 0
var p_damage 
var e_damage = 1
var already_in = 0
var background
var level2_unlock = 0
var level3_unlock = 0
var level4_unlock = 0
var level5_unlock = 0
var level6_unlock = 0
var e_skin = 0
var p_skin = 0
var t_skin = 1
var money = 0
var reward = 0
var tutorial_done = 0
var money_file = "user://money.txt"
var lv2_file = 'user://Lv2_file.txt'
var lv3_file = 'user://Lv3_file.txt'
var lv4_file = 'user://Lv4_file.txt'
var lv5_files = 'user://Lv5_files.txt'
var lv6_files = 'user://Lv6_files.txt'
var Mathieux = 0 
var Vince = 0
var Brook = 0
var Fernando = 0
var Devo = 0
var sound = true
var mathieux_file = 'user://Mathieux.txt'
var vince_file = 'user://Mince.txt'
var brook_file = 'user://Brook.txt'
var fernando_file =  'user://Fernando.txt'
var devo_file = 'user://Devo.txt'
var t_file = 'user://t_file.txt'
var tg_file = 'user://game_tutorial_file.txt'
var previous = 0
var menu_tuto = 0

func _ready():
	setup()
	pass

func aguerri():
	var f = File.new()
	if f.file_exists(t_file):
		f.open(t_file, File.READ)
		var content = f.get_as_text()
		menu_tuto = int(content)
		f.close()
	var z = File.new()
	if z.file_exists(tg_file):
		z.open(tg_file, File.READ)
		var content = z.get_as_text()
		tutorial_done = int(content)
		z.close()

func save_xp():
	var f = File.new()
	f.open(t_file, File.WRITE)
	f.store_string(str(menu_tuto))
	f.close()
	var z = File.new()
	z.open(tg_file, File.WRITE)
	z.store_string(str(tutorial_done))
	z.close()

func character_setup():
	var a = File.new()
	if a.file_exists(mathieux_file):
		a.open(mathieux_file, File.READ)
		var content = a.get_as_text()
		Mathieux = int(content)
		a.close()
	var b = File.new()
	if b.file_exists(vince_file):
		b.open(vince_file, File.READ)
		var content = b.get_as_text()
		Vince = int(content)
		b.close()
	var c = File.new()
	if c.file_exists(brook_file):
		c.open(brook_file, File.READ)
		var content = c.get_as_text()
		Brook = int(content)
		c.close()
	var d = File.new()
	if d.file_exists(fernando_file):
		d.open(fernando_file, File.READ)
		var content = d.get_as_text()
		Fernando = int(content)
		d.close()
	var e = File.new()
	if e.file_exists(devo_file):
		e.open(devo_file, File.READ)
		var content = e.get_as_text()
		Devo = int(content)
		e.close()
	pass

func save_character():
	var f = File.new()
	f.open(mathieux_file, File.WRITE)
	f.store_string(str(Mathieux))
	f.close()
	var a = File.new()
	a.open(vince_file, File.WRITE)
	a.store_string(str(Vince))
	a.close()
	var b = File.new()
	b.open(brook_file, File.WRITE)
	b.store_string(str(Brook))
	b.close()
	var c = File.new()
	f.open(fernando_file, File.WRITE)
	f.store_string(str(Fernando))
	f.close()
	var d = File.new()
	f.open(devo_file, File.WRITE)
	f.store_string(str(Devo))
	f.close()

func setup():
	var f = File.new()
	if f.file_exists(money_file):
		f.open(money_file, File.READ)
		var content = f.get_as_text()
		money = int(content)
		f.close()

func save_score():
	var f = File.new()
	f.open(money_file, File.WRITE)
	f.store_string(str(money))
	f.close()


func unlock_setup_lv2():
	var f = File.new()
	if f.file_exists(lv2_file):
		f.open(lv2_file, File.READ)
		var content = f.get_as_text()
		level2_unlock = int(content)
		f.close()

func save_unlock_lv2():
	var f = File.new()
	f.open(lv2_file, File.WRITE)
	f.store_string(str(level2_unlock))
	f.close()

func unlock_setup_lv3():
	var f = File.new()
	if f.file_exists(lv3_file):
		f.open(lv3_file, File.READ)
		var content = f.get_as_text()
		level3_unlock = int(content)
		f.close()

func save_unlock_lv3():
	var f = File.new()
	f.open(lv3_file, File.WRITE)
	f.store_string(str(level3_unlock))
	f.close()

func unlock_setup_lv4():
	var f = File.new()
	if f.file_exists(lv4_file):
		f.open(lv4_file, File.READ)
		var content = f.get_as_text()
		level4_unlock = int(content)
		f.close()

func save_unlock_lv4():
	var f = File.new()
	f.open(lv4_file, File.WRITE)
	f.store_string(str(level4_unlock))
	f.close()

func unlock_setup_lv5():
	var f = File.new()
	if f.file_exists(lv5_files):
		f.open(lv5_files, File.READ)
		var content = f.get_as_text()
		level5_unlock = int(content)
		f.close()

func save_unlock_lv5():
	var f = File.new()
	f.open(lv5_files, File.WRITE)
	f.store_string(str(level5_unlock))
	f.close()

func unlock_setup_lv6():
	var f = File.new()
	if f.file_exists(lv6_files):
		f.open(lv6_files, File.READ)
		var content = f.get_as_text()
		level6_unlock = int(content)
		f.close()

func save_unlock_lv6():
	var f = File.new()
	f.open(lv6_files, File.WRITE)
	f.store_string(str(level6_unlock))
	f.close()

