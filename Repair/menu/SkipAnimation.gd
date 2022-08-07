extends AnimationPlayer

func _input(event):
	if not event is InputEventMouseMotion:
		if current_animation == "fade_in":
			current_animation = "RESET"
