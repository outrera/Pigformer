extends 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(Constants.G_PLAYER)
	

func _integrate_forces(state):
	if Input.is_action_pressed("ui_up") && is_on_floor():
		$body.apply_impulse(Vector2(10,0))
	if Input.is_action_pressed("ui_left"):
		$body.apply_impulse(Vector2(10,0))
	elif Input.is_action_pressed("ui_right"):
		$body.apply_impulse(Vector2(10,0))
	if Input.is_key_pressed(KEY_SPACE):
		$body/Chain.LaunchHook()
