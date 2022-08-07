
extends Node2D

export(Array,int) var password := [1,3] 
export var active := false


onready var remote_switch = $RemoteSwitch
onready var wbw = $"../wbw"
onready var collision = $Collision
onready var sprite = $Sprite



func _ready():
	remote_switch.command = password
	remote_switch._ready()
	wbw.connect("number_signal", remote_switch, "_on_wbw_number_signal")


func _on_RemoteSwitch_switch():
	active = ! active
	switch_update(active)
	
func switch_update(active):
	collision.disabled = active
	if active:
		sprite.animation = "open"
	else:
		sprite.animation = "closed"
