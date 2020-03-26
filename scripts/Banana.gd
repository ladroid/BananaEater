extends Area2D



func _ready():
	pass 


func _on_Banana_body_entered(body):
	if "BananaPlayer" in body.name:
		$"/root/Global".energy_count += 1
		queue_free() 
	elif "Enemy" in body.name:
		queue_free()
	else:
		while $"/root/Global".energy_count < 100 and $"/root/Global".energy_count > 0:
			$"/root/Global".energy_count -= 1
