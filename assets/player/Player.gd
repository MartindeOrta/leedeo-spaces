extends KinematicBody2D

export (PackedScene) var Shoot


const SPEED = 100
onready var motion = Vector2.ZERO
onready var can_shoot : bool = true
onready var screensize = get_viewport_rect().size


func _ready():
		$AnimationSprite.play()

func _physics_process(delta):
	motion_ctrl()
	animation_ctrl()
	motion = move_and_collide(motion * delta)
	
func _input(event):
	if event.is_action_pressed("ui_accept") and can_shoot:
		shoot_ctrl()

		
