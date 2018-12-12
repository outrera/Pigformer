extends Node2D

const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0
const GRAVITY = 500
const SIDING_CHANGE_SPEED = 10
const STOP_ANIMATION_THRESHOLD = 5

#We declare them as vars to let subclasses change this
var WALK_SPEED = 150 # pixels/sec
var JUMP_SPEED = 15000


var linear_vel : Vector2 = Vector2(0,0)
var target_vel : Vector2 = Vector2(0,0)
var prev_anim : String = ""


func _ready():
	add_to_group(Constants.G_CHARACTER)
	
	
func move(_delta : float, direction : Vector2) -> void:
	target_vel.x = WALK_SPEED*direction.x
	target_vel.y = JUMP_SPEED*direction.y
	
	linear_vel.x = lerp(linear_vel.x, target_vel.x, 0.2)
	linear_vel.y = lerp(linear_vel.y, target_vel.y + GRAVITY, 0.02)

	linear_vel = $body.move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)

func animate(animation : String):
	if animation != prev_anim:
		$AnimationPlayer.play(animation)
		prev_anim = animation

func receiveDmg(_dmg : float, _source : Object):
	#var sourcePos = _source.getGlobalPosition()
	#var direction = ($body.global_position - sourcePos).normalized()
	#externalImpulse += direction*EXTERNAL_IMPULSE
	# TODO DMG
	pass

################################################ Position
func getGlobalPosition() -> Vector2:
	return $body.global_position

func setGlobalPosition(newPos : Vector2) -> void:
	$body.global_position = newPos

func is_on_floor() -> bool:
	return $body.is_on_floor()

func is_on_wall() -> bool:
	return $body.is_on_wall()

func is_on_ceilling() -> bool:
	return $body.is_on_ceilling()