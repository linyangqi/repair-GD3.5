class_name wbw
extends Player

onready var sprite = $Sprite

func _process(delta):
	if Input.is_action_pressed("move_left"):
		sprite.scale.x = -1
	if Input.is_action_pressed("move_right"):
		sprite.scale.x = 1

#
#onready var sprite = $Sprite
#
#
#export var speed = 30
#export var jump_velocity = 40
#export var gravity_factor = 0.2
#
## Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * gravity_factor
##var gravity = 0
#var velocity:Vector2
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("jump") and is_on_floor():
#		velocity.y = -jump_velocity
#
#	var direction = get_direction()
#
#	if direction:
#		velocity.x = direction.x * speed
#	else:
#		velocity.x = move_toward(velocity.x, 0, speed)
#
#	#图像变换
#	if direction.x != 0:
#		if direction.x > 0:
#			sprite.scale.x = 1
#		else:
#			sprite.scale.x = -1
#
#	move_and_slide(velocity)
#	position.x = clamp(position.x,0,320)
#
#func get_direction():
#	return Vector2(
#		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
#		-1 if is_on_floor() and Input.is_action_just_pressed("jump") else 0
#	)
