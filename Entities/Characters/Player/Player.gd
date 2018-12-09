extends "res://Entities/Characters/Character.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(Constants.G_PLAYER)

func _physics_process(delta):
	var direction = input()
	move(delta, direction)

func input() -> Vector2:
	var direction = Vector2(0,0)
	
	if(Input.is_action_pressed("ui_up") && is_on_floor()):
		direction.y = -1
	if(Input.is_action_pressed("ui_left")):
		direction.x += -1
	elif(Input.is_action_pressed("ui_right")):
		direction.x += 1
	return direction