extends Area2D

const speed = 100
var velocity = Vector2()
var direction = 1

func set_banana_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = speed * delta * direction
	translate(velocity)
	$AnimatedSprite.play("bananabull")


func _on_BananaBullet_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
