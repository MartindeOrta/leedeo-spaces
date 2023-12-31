extends KinematicBody2D

export (PackedScene) var Shoot

const SPEED = 100
onready var motion = Vector2.ZERO #Es lo mismo que poner Vector2(0,0)
onready var can_shoot : bool = true
onready var screensize = get_viewport_rect().size # Tamaño de nuestra ventana.

func _ready():
	$AnimatedSprite.play()

func _physics_process(delta):
	motion_ctrl()
	animation_ctrl()
	motion = move_and_collide(motion * delta)
	
func _input(event):
	if event.is_action_pressed("ui_accept") and can_shoot:
		shoot_ctrl()
	# exelente funcion para registrar los movimeintos con los botones propio del tutorial 		
func get_axis() -> Vector2: #Obtener ejes
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis

func motion_ctrl(): #Controla los moviminestos
	if get_axis() == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		motion = get_axis().normalized() * SPEED
	#limitar movimientos del personaje
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
func animation_ctrl(): #controladore de animaciones
	if get_axis().x == 1:
		$AnimatedSprite.animation = "Horizontal"
		$AnimatedSprite.flip_h = true
	elif get_axis().x == -1:
		$AnimatedSprite.animation = "Horizontal"	
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "Vertical"

func shoot_ctrl(): # Controlador de disparo
	var shoot = Shoot.instance()
	shoot.global_position = $ShootSpawn.global_position
	get_tree().call_group("level", "add_child", shoot)		
	
			
	

		
