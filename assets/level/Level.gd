extends Node2D

func _ready():
	$bgMusic.play()
	
func _physics_process(delta):
	get_node("Background").scroll_base_offset += Vector2(0,1) * 8 * delta
	get_node("Cloud01").scroll_base_offset += Vector2(0, 1) * 24 * delta
	get_node("Cloud02").scroll_base_offset += Vector2(0, 2) * 34 * delta