extends Node


func _ready():
	pass 

#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
