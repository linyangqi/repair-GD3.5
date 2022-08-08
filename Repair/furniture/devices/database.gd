
extends Area2D

export(Array,int) var password := [1,3] 
export var active := false
export var dialogue_timeline := ""

onready var remote_switch = $RemoteSwitch
onready var wbw = $"../../wbw"
onready var collision = $Collision
onready var sprite = $Sprite
onready var dialogue = Dialogic.start(dialogue_timeline)




func _ready():
	remote_switch.command = password
	remote_switch._ready()
	
	


func _on_RemoteSwitch_switch():
	active = ! active
	switch_update(active)
	
func switch_update(active):
	collision.disabled = !active
	if active:
		sprite.animation = "on"
		if overlaps_body(wbw):
			add_child(dialogue)
	else:
		sprite.animation = "off"


func _on_Database_body_entered(body):
	if active and body == wbw :
		add_child(dialogue)
