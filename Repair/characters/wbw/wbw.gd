class_name wbw
extends Player

signal arrive_left
signal arrive_right
signal arrive_up
signal arrive_down

onready var sprite = $Sprite
var stage_height = ProjectSettings.get_setting("display/window/size/height")
var stage_width = ProjectSettings.get_setting("display/window/size/width")



func _process(delta):
	#运动图像改变
	if Input.is_action_pressed("move_left"):
		sprite.scale.x = -1
	if Input.is_action_pressed("move_right"):
		sprite.scale.x = 1
	
	#屏幕边缘信号
	if position.x < 0:
		emit_signal("arrive_left")
	if position.x > stage_width:
		emit_signal("arrive_left")
	if position.y < 0:
		emit_signal("arrive_up")
	if position.y > stage_height:
		emit_signal("arrive_down")

func _physics_process(delta):
	
	pass
