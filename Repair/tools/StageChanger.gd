extends Node


onready var wbw = $"../wbw"
onready var global = $"/root/Global"

export(String,FILE,"*.tscn") var stage_left = ""
export(String,FILE,"*.tscn") var stage_right = ""
export(String,FILE,"*.tscn") var stage_above = ""
export(String,FILE,"*.tscn") var stage_below = ""

#var stage_height = ProjectSettings.get_setting("display/window/size/height")
#var stage_width = ProjectSettings.get_setting("display/window/size/width")
export var stage_width = 640
export var stage_height = 360

func _ready():
	if global.switching_stage:
		wbw.position = global.wbw_position
		global.switching_stage = false


func _on_wbw_arrive_left():
	if stage_left != "":
		global.switching_stage = true
		global.wbw_position = wbw.position + Vector2(stage_width,0)
		get_tree().change_scene(stage_left)

func _on_wbw_arrive_right():
	if stage_right != "":
		global.switching_stage = true
		global.wbw_position = wbw.position + Vector2(-stage_width,0)
		get_tree().change_scene(stage_right)
		
func _on_wbw_arrive_above():
	if stage_left != "":
		global.switching_stage = true
		global.wbw_position = wbw.position + Vector2(0,stage_height)
		get_tree().change_scene(stage_above)

func _on_wbw_arrive_below():
	if stage_left != "":
		global.switching_stage = true
		global.wbw_position = wbw.position + Vector2(0,-stage_height)
		get_tree().change_scene(stage_below)
