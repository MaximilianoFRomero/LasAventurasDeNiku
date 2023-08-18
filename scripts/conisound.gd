extends Node


func _on_Coin2d_body_entered(body : Node) -> void:
	if body.is_in_group("player"):
		$AudioStreamPlayer.playing = true
		body.addCoin()
		queue_free()
