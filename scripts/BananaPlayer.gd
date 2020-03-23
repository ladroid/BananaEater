extends KinematicBody2D

const gravity = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var on_ground = false
var is_dead = false
var speed = 250
var jump_power = -300

func _physics_process(delta):
	if is_dead == false:
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			#if sign($Position2D.position.x) == -1:
				#$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
			#if sign($Position2D.position.x) == 1:
				#$Position2D.position.x *= -1
		else:
			velocity.x = 0
			if on_ground == true:
				$AnimatedSprite.play("idle")	
			
		if Input.is_action_pressed("ui_up"):
			if on_ground == true:
				velocity.y = jump_power
				on_ground = false
			
		velocity.y += gravity
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("jump")
		
		velocity = move_and_slide(velocity, FLOOR)
		
		if Input.is_action_just_pressed("space"):
			$AnimatedSprite.play("grab")