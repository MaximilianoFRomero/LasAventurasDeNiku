extends Control

func _on_jugar_pressed():
	get_tree().change_scene("res://escenas/carga1.tscn")


func _on_salir_pressed():
	get_tree().quit()
	
func _input(event: InputEvent) ->void:
	if Input.is_action_pressed("play"):
		get_tree().change_scene("res://escenas/carga1.tscn")
	if Input.is_action_pressed("credits"):
		get_tree().change_scene("res://escenas/fin.tscn")
	if Input.is_action_pressed("quit"):
		get_tree().quit()

	


func _on_creditos_pressed():
	get_tree().change_scene("res://escenas/fin.tscn")
