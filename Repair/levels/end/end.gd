extends Control


onready var global = $"/root/Global"

func _ready():
	global.wbw_position = Vector2(600,300)


func _on_Timer_timeout():
	var dialogue = Dialogic.start("end")
	add_child(dialogue)
