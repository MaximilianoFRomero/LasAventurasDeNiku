extends Area2D

signal coinCollected

func _on_coin2d_body_entered(body):
	if body.get_name()=="player":
		$AudioStreamPlayer.playing = true
		body.addCoin()
		yield(get_tree().create_timer(0.2), "timeout")
		queue_free()

