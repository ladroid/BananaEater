extends Node2D

var banana_scn = preload("res://scenes/Banana.tscn")
var enemy_scn = preload("res://scenes/Enemy.tscn")
var banana_spawn_delay = 20.0/60.0
var timer = 0.0
var count = 0

func _ready():
	set_physics_process(true)
	set_process(true)
	randomize()
	$BananaPlayer/DialogueBox.visible = false

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
	
	$Control/CanvasLayer/RichTextLabel.text = str($"/root/Global".energy_count)

func _on_Timer_timeout():
	var posX = rand_range(48.417, 2257.554)
	var enemy = enemy_scn.instance()
	add_child(enemy)
	enemy.position = Vector2(posX, 563.867)
	$Timer.wait_time = max(16, $Timer.wait_time - 10)
