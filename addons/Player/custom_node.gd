tool
extends EditorPlugin

func _enter_tree():
    add_custom_type("Player", "KinematicBody2D", preload("player.gd"), null)

func _exit_tree():
    remove_custom_type("Player")