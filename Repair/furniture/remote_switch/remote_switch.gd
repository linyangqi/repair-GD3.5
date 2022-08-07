extends Node2D

signal switch
onready var require = $Require
onready var display = $Display

#ps：命令中的数字必须大于0才能被激活
# 或者……0只有在某些机关处可以被激活？
export(Array,int) var command := [1,2] 
var point = 0

func _ready():
	var command_string =""
	for number in command:
		command_string += str(number) + " "
	require.text = command_string
	display.text = command_string
	display.visible_characters = 0
	

func _on_wbw_number_signal(number):
	if number == command[point]:
		point += 1
		if point == command.size():
			emit_signal("switch")
			point = 0
	else:
		point = 0
	display.visible_characters = point
	

#正确了就记录，错误了就清空——这一条可以用作顺序式解密吧
