extends KinematicBody2D

func _ready():
	$AnimationPlayer.play("fueg")
	
	


func _on_Area2D_body_entered(body):
	if body.get_name()=="player":
		$AudioStreamPlayer.playing = true
		#yield(get_tree().create_timer(0.3), "timeout")
		body.loseLife(position.x)
		pass
