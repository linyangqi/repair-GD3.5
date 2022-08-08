extends Control



func _on_Timer_timeout():
	var dialogue = Dialogic.start("end")
	add_child(dialogue)
