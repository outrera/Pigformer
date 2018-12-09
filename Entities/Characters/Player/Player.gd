extends "res://Entities/Characters/Character.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(Constants.G_PLAYER)

func input():
	pass