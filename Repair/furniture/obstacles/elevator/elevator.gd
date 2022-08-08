extends Node2D

export(Array,int) var password := [1,3] 
export var active := false
export var motion:Vector2
export var speed:int = 50


onready var origin:Vector2 = position
onready var remote_switch = $RemoteSwitch
onready var wbw = $"../../wbw"
onready var collision = $Collision
onready var sprite = $Sprite

func _ready():
	remote_switch.command = password
	remote_switch._ready()
	
	


func _on_RemoteSwitch_switch():
	active = ! active
	switch_update(active)
	
func switch_update(active):
#	collision.disabled = active
	if active:
		sprite.animation = "on"
	else:
		sprite.animation = "off"

func _physics_process(delta):
	if active:
		position.x = move_toward(position.x, origin.x + motion.x, speed * delta)
		position.y = move_toward(position.y, origin.y + motion.y, speed * delta)
	else:
		position.x = move_toward(position.x, origin.x, speed * delta)
		position.y = move_toward(position.y, origin.y, speed * delta)
