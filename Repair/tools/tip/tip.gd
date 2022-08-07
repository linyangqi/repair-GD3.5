extends LinkButton

export var wait_time := 10
export var dialogue_timeline := ""
export var auto_start := true

onready var tip_time = $TipTime

func _ready():
	tip_time.wait_time = wait_time
	tip_time.start()


func _on_TipTime_timeout():
	visible = true
	if auto_start:
		_pressed()
	
func _pressed():
	var dialogue = Dialogic.start(dialogue_timeline)
	add_child(dialogue)
