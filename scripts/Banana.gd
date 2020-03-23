extends Area2D



func _ready():
	pass 


func _on_Banana_body_entered(body):
	if "BananaPlayer" in body.name:
		queue_free() 
