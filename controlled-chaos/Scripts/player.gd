extends CharacterBody2D
class_name Player

const speed = 550
const jump_power = -1500

const acc = 30
const friction = 15

const gravity = 120

const max_jump = 2
var current_jump = 1

func _physics_process(delta):
	var input_dir: Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		#play_animation()
	else:
		add_friction()
		#play_animation
	player_movement()
	jump()
	$Sprite2D.rotation += velocity.x * delta * 0.05

func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("ui_left" , "ui_right")
	input_dir = input_dir.normalized()
	return input_dir
	
func accelerate(direction):
	velocity = velocity.move_toward(Vector2(speed * direction.x, velocity.y), acc)
	
func add_friction():
	velocity = velocity.move_toward(Vector2(0, velocity.y), friction)
	
func player_movement():
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("ui_up"):
		if current_jump < max_jump:
			velocity.y = jump_power
			current_jump += 1
	else:
		velocity.y += gravity
	if is_on_floor():
		current_jump = 1
func play_animation():
	pass
