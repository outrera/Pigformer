extends Node2D

const FLOOR_NORMAL = Vector2(0, 1)
const SLOPE_SLIDE_STOP = 25.0
const WALK_SPEED = 150 # pixels/sec
const SIDING_CHANGE_SPEED = 10
const STOP_ANIMATION_THRESHOLD = 5

const EXTERNAL_IMPULSE = 4000
const IMPULSE_MITIGATION_FACTOR = 2

const MAX_SPEED_AND_IMPULSE = 400

var linear_vel : Vector2 = Vector2(0,0)
var target_vel : Vector2 = Vector2(0,0)
var prev_anim : String = ""

var externalImpulse = Vector2()

func _ready():
	add_to_group(Constants.G_CHARACTER)
	
	
func move(_delta : float, direction : Vector2) -> void:
	target_vel *= WALK_SPEED*direction.normalized()

	linear_vel.x = lerp(linear_vel.x, target_vel.x + externalImpulse.x, 0.1)
	linear_vel.y = lerp(linear_vel.y, target_vel.y + externalImpulse.y, 0.1)
	
	#We clamp the linear velocity
	linear_vel = linear_vel.clamped(MAX_SPEED_AND_IMPULSE)
	linear_vel = $body.move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	externalImpulse /= IMPULSE_MITIGATION_FACTOR

func animate(animation : String):
	if animation != prev_anim:
		$AnimationPlayer.play(animation)
		prev_anim = animation

func receiveDmg(dmg : float, _source : Object):
	var sourcePos = _source.getGlobalPosition()
	var direction = ($body.global_position - sourcePos).normalized()
	externalImpulse += direction*EXTERNAL_IMPULSE
	# TODO DMG


################################################ Position
func getGlobalPosition():
	return $body.global_position

func setGlobalPosition(newPos):
	$body.global_position = newPos