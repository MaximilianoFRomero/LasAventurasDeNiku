extends KinematicBody2D

var gravity = 10
var speed = 75
var velocity = Vector2(0,0)
var regreso = true

func _ready():
	$AnimationPlayer.play("bat")

func move_character():
	velocity.y +=gravity
	if (regreso):
		velocity.x = -speed
		velocity = move_and_slide(velocity, Vector2.UP)
	else:
		velocity.x = speed
		velocity = move_and_slide(velocity, Vector2.UP)

func turn():
	if not $RayCast2D.is_colliding() or $RayCast2D2.is_colliding():
		regreso = !regreso
		scale.x = -scale.x

func _process(delta):
	move_character()
	turn()




func _on_Area2D_body_entered(body):
	if body.get_name()=="player":
		$AudioStreamPlayer.playing = true
		#yield(get_tree().create_timer(0.3), "timeout")
		body.loseLife(position.x)
		pass
