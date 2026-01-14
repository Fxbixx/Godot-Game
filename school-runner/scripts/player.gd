extends CharacterBody2D


var speed = 300.0
var multi = 1.0
const JUMP_VELOCITY = -700.0
const GRAVITY = 1300

func _ready() -> void:
	$AnimatedSprite2D.play("Run")
	

func _physics_process(delta: float) -> void:
	if $"../CanvasLayer/Death".visible == false:
		velocity.x = speed * multi 
		#The jump
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		# The gravity
		if not is_on_floor():
			velocity.y += GRAVITY * delta
		move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	$"../CanvasLayer/Death".visible = true
	$"../CanvasLayer/TextureButton".visible = true
	$"../CanvasLayer/TextureButton2".visible = true
	$AnimatedSprite2D.stop()
	
