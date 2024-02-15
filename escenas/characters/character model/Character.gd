extends KinematicBody2D
class_name Character

var knockback_dir:Vector2

var direction: Vector2 = Vector2()
var velocity:Vector2

export var speed:float

export var lifes:int

#variables salto preciso (fisicas)
var gravity:float
# 32 es el tamanio de los tilesets
var jump_height = 2.5 * 32
var jump_velocity = 0
var jump_time = 0.4

func _ready():
	gravity = 2 * jump_height / pow(jump_time, 2)
	jump_velocity = -jump_time * gravity


func _physics_process(delta):
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor() or is_on_ceiling():
		velocity.y = 0
		
