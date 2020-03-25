extends Node2D

var banana_scn = preload("res://scenes/Banana.tscn")
var banana_spawn_delay = 20.0/60.0
var timer = 0.0

func _ready():
	set_physics_process(true)
	randomize()
	$BananaPlayer/DialogueBox.visible = false
	#$DialogueBox.visible = false

func spawn_banana():
	var banana = banana_scn.instance()
	var spownPos = get_node("SpawnPosition").get_children()
	var spawnIndx = randi() % spownPos.size()
	var spawnPonts = spownPos[spawnIndx]
	spownPos.remove(spawnIndx)
	var pos = spawnPonts.get_global_position()
	banana.set_position(pos)
	get_parent().add_child(banana)

func _physics_process(delta):
	if timer > banana_spawn_delay:
		timer -= banana_spawn_delay
		spawn_banana()
	timer += delta
