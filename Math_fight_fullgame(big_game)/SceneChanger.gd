extends Node


export var max_load_time = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func goto_scene(path,current_scene):
	var loader = ResourceLoader.load_interactive(path)
	
	if loader == null:
		print("Resource loader unable to load the resource at path")
		return
	var loading_bar = load("res://LoadingBar/Loading_bar.tscn").instance()
	
	get_tree().get_root().call_deferred('add_child',loading_bar)
	
	var t = OS.get_ticks_msec()
	
	while OS.get_ticks_msec() - t < max_load_time:
		var err = loader.poll()
		if err == ERR_FILE_EOF:
			var resource = loader.get_resource()
			get_tree().get_root().call_deferred('add_child',resource.instance())
			current_scene.queue_free()
			loading_bar.queue_free()
			break
		elif err == OK:
			var progress = float(loader.get_stage())/loader.get_stage_count()
			loading_bar.get_node("TextureProgress").value = progress * 100
			loading_bar.get_node("Label").text = str(stepify(progress,0.01) * 100)
			print(progress)
		else:
			print("Error while loading file")
			break
		yield(get_tree(),"idle_frame")
	pass
