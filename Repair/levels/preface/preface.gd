extends Control



func _on_Timer_timeout():
	var dialogue = Dialogic.start("preface")
	add_child(dialogue)
