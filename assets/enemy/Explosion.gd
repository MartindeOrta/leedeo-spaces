extends Node2D

func _ready():
	$AnimatedSprite.play()
	$SoundExplosion.play()

func _on_SoundExplosion_finished():
	queue_free() # Replace with function body.
