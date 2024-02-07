extends Area2D

onready var coins = get_node("res://escenas/hud.tscn")

func _on_Area2D2_body_entered(body):
	if body.get_name()=="player":
		print(body.get_name())
		get_tree().change_scene("res://escenas/carga2.tscn")
