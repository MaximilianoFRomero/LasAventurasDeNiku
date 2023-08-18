extends KinematicBody2D




const VelMov = 20
const MaxVel = 60
const Salto = -155
const Arriba = Vector2(0, -1)
const Gravedad = 3

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
var coins

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
		
	#if Input.is_action_pressed("ui_cancel") or Input.is_action_just_pressed("pause"):
		#get_tree().paused = not get_tree().paused

func addCoin():
	var canvasLayer = get_tree().get_root().find_node("hud", true, false)
	canvasLayer.handleCoinCollected()

func loseLife():
	print("vida menos")
	get_tree().reload_current_scene()
	
