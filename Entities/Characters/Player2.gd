extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _integrate_forces(_state):
	if Input.is_action_pressed("ui_up"):
		apply_impulse(Vector2(), Vector2(0,-50 * mass))
	if Input.is_action_pressed("ui_left"):
		apply_impulse(Vector2(), Vector2(-20  * mass,0))
	elif Input.is_action_pressed("ui_right"):
		apply_impulse(Vector2(), Vector2(20  * mass,0))
	if Input.is_key_pressed(KEY_SPACE):
		$Chain.LaunchHook()