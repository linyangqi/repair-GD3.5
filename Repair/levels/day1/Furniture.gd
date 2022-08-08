extends Node




func _on_wbw_number_signal(number):
	for node in get_children():
		node.get_node("RemoteSwitch")._on_wbw_number_signal(number)
