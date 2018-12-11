extends Node2D

func _process(_delta):
	if(Input.is_action_pressed("ui_pause")):
		get_tree().paused = false
		queue_free()