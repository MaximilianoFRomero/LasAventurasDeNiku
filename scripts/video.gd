extends Node

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	yield(get_tree().create_timer(11), "timeout")
	get_tree().change_scene("res://escenas/inicio.tscn")
	
