extends KinematicBody2D

const gravity = 10
const speed = 50
var hp = 2
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false

func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		$AnimatedSprite.play("die")
		$CollisionShape2D.set_deferred("disabled", true)
		queue_free()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = speed * direction
		if direction == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
		velocity.y += gravity
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "BananaPlayer" in get_slide_collision(i).collider.name:
				$AnimatedSprite.play("attack")
				yield(get_tree().create_timer(3), "timeout")
				get_slide_collision(i).collider.dead()
