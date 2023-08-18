extends Area2D



func _on_Area2D_body_entered(body):
	if body.get_name()=="player":
		yield(get_tree().create_timer(0.3), "timeout")
		get_tree().change_scene("res://escenas/carga4.tscn")
