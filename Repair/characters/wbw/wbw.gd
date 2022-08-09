class_name wbw
extends Player

signal arrive_left
signal arrive_right
signal arrive_above
signal arrive_below

signal number_signal(number)
var signal_number := 0

onready var sprite = $Sprite
onready var global = $"/root/Global"
onready var stage_changer = $"../StageChanger"
onready var stage_height = stage_changer.stage_height
onready var stage_width = stage_changer.stage_width
onready var furniture = $"../Furniture"
onready var signal_sound = $Sound/SignalSound




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
		emit_signal("arrive_right")
	if position.y < 0:
		emit_signal("arrive_above")
	if position.y > stage_height:
		emit_signal("arrive_below")

func _input(event):
	if event.is_action_pressed("emit_signal"):
		sprite.animation = "signal"
		signal_number = 0
		
	if event.is_action_released("emit_signal"):
		sprite.animation = "idle"
		if signal_number >= 1:
			emit_signal("number_signal", signal_number)
		


func _on_Sprite_animation_finished():
	if sprite.animation == "signal":
		signal_number += 1
		signal_sound.playing = true
