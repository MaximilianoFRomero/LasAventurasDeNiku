extends Node

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
		$AudioStreamPlayer.playing = true
		$fondo.visible = not $fondo.visible
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = false
		$AudioStreamPlayer.playing = true
		$fondo.visible = not $fondo.visible
		
