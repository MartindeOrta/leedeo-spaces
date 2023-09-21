extends Area2D

export (PackedScene) var Explosion
var speed

var listanimate = ["edu","Cesar","Boli"]
func _ready():
	print((randi() % 3 ))
	$AnimatedSprite.animation = listanimate[randi() % len(listanimate)]

	$AnimatedSprite.play()
	speed = GLOBAL.random(GLOBAL.vel_min, GLOBAL.vel_max)
	
func _physics_process(delta):
	position.y += speed * delta
	
func death_enemy():
	queue_free()
	explosion_crlt()

func explosion_crlt():
	var explosion = Explosion.instance()
	explosion.global_position = $ExplosionSpawn.global_position
	get_tree().call_group("level", "add_child", explosion)
	



func _on_Enemy_area_entered(area):
	if area.is_in_group("shoot"):
		death_enemy()
		GLOBAL.score += 10
		if GLOBAL.score % 50 == 0:
			GLOBAL.vel_max *= 1.2
			GLOBAL.vel_min *= 1.2
	
	 # Replace with function body.


func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		death_enemy()
		body.queue_free()# Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.
