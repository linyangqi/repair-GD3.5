extends Label



func _on_wbw_number_signal(number):
	text = str(number)
	$AnimationPlayer.play("number")
