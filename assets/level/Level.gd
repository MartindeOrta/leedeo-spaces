extends Node2D

export (PackedScene) var Enemy

func _ready():
	$bgMusic.play()
	$EnemyTimer.start()
	randomize()
	
func _physics_process(delta):
	get_node("Background").scroll_base_offset += Vector2(0,1) * 8 * delta
	get_node("Cloud01").scroll_base_offset += Vector2(0, 1) * 24 * delta
	get_node("Cloud02").scroll_base_offset += Vector2(0, 1) * 34 * delta


func _on_HUD_game_over():
	$bgMusic.stop() # Replace with function body.


func _on_EnemyTimer_timeout():
	get_node("EnemyPath/EnemySpawn").set_offset(randi())
	var enemy = Enemy.instance()
	add_child(enemy) # Replace with function body.
	enemy.position = get_node("EnemyPath/EnemySpawn").position
	$EnemyTimer.wait_time = GLOBAL.random(1,3)
	$EnemyTimer.start()
	
