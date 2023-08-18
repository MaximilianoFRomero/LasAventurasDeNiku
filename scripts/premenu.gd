extends Node

func _ready():
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://escenas/menu.tscn")
