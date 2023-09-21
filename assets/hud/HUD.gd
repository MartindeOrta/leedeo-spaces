extends CanvasLayer

signal game_over

func _ready():
	GLOBAL.score = 0
	GLOBAL.vel_max = 32
	GLOBAL.vel_min = 42
	
func _physics_process(_delta):
	$ScoreConteiner/HBoxContainer/Score.text =str(GLOBAL.score)


func game_over():
	emit_signal("game_over")
	$GameOverContainer.visible = true
	$BgMusic.play()

func _on_Restart_pressed():
	get_tree().call_deferred("reload_current_scene") # Replace with function body.


func _on_Menu_pressed():
	get_tree().call_deferred("change_scene", "res://assets/menu/Menu.tscn")
	
	
func _on_Player_tree_exiting():
	game_over() # Replace with function body.
