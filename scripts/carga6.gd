extends Node

func _ready():
	yield(get_tree().create_timer(2.5), "timeout")
	get_tree().change_scene("res://escenas/mundo7.tscn")
