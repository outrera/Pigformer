extends "res://Entities/Characters/Character.gd"

func _ready():
	add_to_group(Constants.G_PLAYER)
	WALK_SPEED = 150
	JUMP_SPEED = 20000
	
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
	
	if(Input.is_action_pressed("ui_run")):
		direction.x *= 1.5
	
	return direction
