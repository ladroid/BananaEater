extends Area2D



func _ready():
	pass 


func _on_Banana_body_entered(body):
	if "BananaPlayer" in body.name:
		$"/root/Global".energy_count += 1
		queue_free() 
	else:
		$"/root/Global".energy_count -= 1
