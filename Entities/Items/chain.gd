extends Node2D

var ChainClass = preload("res://Entities/Items/ChainLink.tscn")
var links = []
	
func SpawnOne():
	_spawn()
	
func LaunchHook():
	if(links.size() > 0):
		for l in links:
			l.queue_free()
		links = []
	else:
		$Timer.start()

func _collided():
	$Timer.stop()
	for l in links:
		l.set_mode(RigidBody2D.MODE_RIGID)

func _spawn():
	var link = ChainClass.instance()
	if links.size() > 0:
		link.position = links.back().position + Vector2(15, 0)
	link.set_mode(RigidBody2D.MODE_STATIC)
	add_child(link)
	if links.size() > 0:
		var joint = link.get_node("PinJoint2D")  # The node can be found by its name
		joint.softness = 0
		joint.node_a = joint.get_path_to(links.back())  # Relative paths are way easier to maintain
		joint.node_b = joint.get_path_to(link)
		var _result = Physics2DTestMotionResult.new()
		if(link.test_motion(Vector2(1, 1), true, 0.08, _result)):
			var joint2 = PinJoint2D.new()
			joint2.softness = 0
			link.add_child(joint2)
			var staticPoint = StaticBody2D.new()
			staticPoint.global_position = _result.collider.global_position
			get_tree().get_root().add_child(staticPoint)
			joint2.node_a = joint2.get_path_to(link)  # Relative paths are way easier to maintain
			joint2.node_b = joint2.get_path_to(staticPoint)
			links.append(link)
			_collided()
			return
	else:
		var joint = link.get_node("PinJoint2D")  # The node can be found by its name
		joint.node_a = joint.get_path_to(get_parent())  # Relative paths are way easier to maintain
		joint.node_b = joint.get_path_to(link)
	links.append(link)