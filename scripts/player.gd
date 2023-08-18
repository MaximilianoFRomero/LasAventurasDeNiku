extends KinematicBody2D




const VelMov = 40
const MaxVel = 80
const Salto = -300
const Arriba = Vector2(0, -1)
const Gravedad = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
var coins
var lifes=3

var motion = Vector2()



func _physics_process(delta):
	motion.y += Gravedad
	var friction = false
	
	if Input.is_action_pressed("dButon") or Input.is_action_pressed("ui_right"):
		
		sprite.flip_h = false
		animationPlayer.play("walk")
		motion.x = min (motion.x + VelMov, MaxVel)
	elif Input.is_action_pressed("iButon") or Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		animationPlayer.play("walk")
		motion.x = max (motion.x - VelMov, -MaxVel)
	else:
		animationPlayer.play("idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("jump") or Input.is_action_pressed("ui_up"):
			motion.y = Salto
			$jump.playing = true
		if friction == true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x,0,0.01)
	motion = move_and_slide(motion, Arriba)

func addCoin():
	var canvasLayer = get_tree().get_root().find_node("hud", true, false)
	canvasLayer.handleCoinCollected()

func loseLife():
	if lifes > 0:
		print("vida menos")
		lifes = lifes-1
		get_tree().reload_current_scene()
		
	else:
		get_tree().change_scene("res://escenas/menu.tscn")
		lifes = 3
	


func _on_zoom_body_entered(body):
	if body.get_name()=="player":
		$Camera2D.zoom = Vector2(0.35,0.35)


func _on_zoom_body_exited(body):
	if body.get_name()=="player":
		$Camera2D.zoom = Vector2(0.25,0.25)
